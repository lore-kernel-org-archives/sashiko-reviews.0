Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC50293B75
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727483; cv=none; b=AAMYh2KxzwJaFO1+3aiMDu1ss6M2w/VxTsrdy5x23eBVh+5t6ZUs/V6XygzA4CVROc4utCT+MZlElLs3eRd1svb9o9ASRzVnZV0WdDh2mHA3rofT3CVxjxMtuRkV+vmzq/xbuxkRt4YCO6kDVvJtaq2Bp6m2SxjlvTVMa5dgUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727483; c=relaxed/simple;
	bh=bQBgm/U/C8ssLH07s6byFNVJzFKmHj71pfMeXlDDRhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hk0StCVyVag1zY2YZkBWCUYNRL/mjCKbO6SpkVyBoyaUaHO3r95ISdd2g9UfEji0Hf+v8clmRShuAVRlRJmnwhfBuLbU217SBWZhHQcGp2+RdUHbHF0qTRClwRlZL+D36Ez4raczEjljIF2/7x5OCTBF9VginXb7/rX3gzTEk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3A15968D1F; Wed, 22 Jul 2026 15:37:58 +0200 (CEST)
Date: Wed, 22 Jul 2026 15:37:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: sashiko-reviews@lists.linux.dev
Cc: Christoph Hellwig <hch@lst.de>, tytso@mit.edu
Subject: Re: [PATCH 2/3] iomap: decouple simple direct I/O reads from
 iomap_dio_rw
Message-ID: <20260722133758.GA19103@lst.de>
References: <20260722124931.3159664-1-hch@lst.de> <20260722124931.3159664-3-hch@lst.de> <20260722130251.87D601F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722130251.87D601F00A3A@smtp.kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 22, 2026 at 01:02:51PM +0000, sashiko-bot@kernel.org wrote:
> If the underlying I/O fails, iomap_dio_simple_complete() will return a
> negative error code. The check above (ret <= 0 && ret != -EIOCBQUEUED)
> will then evaluate to true and call inode_dio_end() a second time. This can
> cause i_dio_count to underflow, which may lead to an indefinite hang during
> subsequent calls to inode_dio_wait() such as when calling truncate or fsync.

Yeah, this should fix it:

I'll respin tomorrow.

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 3bdfbd0efa07..f6c8091a65ac 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -994,18 +994,22 @@ ssize_t __iomap_dio_simple(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (iomi->iomap.type != IOMAP_MAPPED ||
 	    iomi->iomap.offset + iomi->iomap.length < iomi->pos + iomi->len ||
-	    (iomi->iomap.flags & IOMAP_F_INTEGRITY))
-		return -ENOTBLK;
+	    (iomi->iomap.flags & IOMAP_F_INTEGRITY)) {
+		ret = -ENOTBLK;
+		goto out_dio_end;
+	}
 
 	alignment = iomap_dio_alignment(iomi->inode, iomi->iomap.bdev, 0);
-	if ((iomi->pos | iomi->len) & (alignment - 1))
-		return -EINVAL;
+	if ((iomi->pos | iomi->len) & (alignment - 1)) {
+		ret = -EINVAL;
+		goto out_dio_end;
+	}
 
 	if (unlikely(!iomi->inode->i_sb->s_dio_done_wq &&
 			!is_sync_kiocb(iocb))) {
 		ret = sb_init_dio_done_wq(iomi->inode->i_sb);
 		if (ret < 0)
-			return ret;
+			goto out_dio_end;
 	}
 
 	trace_iomap_dio_rw_begin(iocb, iter, 0, 0);
@@ -1013,8 +1017,10 @@ ssize_t __iomap_dio_simple(struct kiocb *iocb, struct iov_iter *iter,
 	bio = bio_alloc_bioset(iomi->iomap.bdev,
 			       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
 			       REQ_OP_READ, gfp, &iomap_dio_simple_pool);
-	if (!bio)
-		return -EAGAIN;
+	if (!bio) {
+		ret = -EAGAIN;
+		goto out_dio_end;
+	}
 	sr = container_of(bio, struct iomap_dio_simple, bio);
 	sr->iocb = iocb;
 	sr->dio_flags = 0;
@@ -1060,6 +1066,8 @@ ssize_t __iomap_dio_simple(struct kiocb *iocb, struct iov_iter *iter,
 	bio_release_pages(bio, false);
 out_bio_put:
 	bio_put(bio);
+out_dio_end:
+	inode_dio_end(iomi->inode);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(__iomap_dio_simple);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 810dc4b8dc94..737ca6d043c7 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -732,11 +732,12 @@ static __always_inline ssize_t iomap_dio_read_simple(struct kiocb *iocb,
 	inode_dio_begin(iomi.inode);
 	ret = begin(iomi.inode, iomi.pos, iomi.len, iomi.flags, &iomi.iomap,
 			&iomi.srcmap);
-	if (!ret)
-		ret = __iomap_dio_simple(iocb, iter, &iomi);
-	if (ret <= 0 && ret != -EIOCBQUEUED)
+	if (ret) {
 		inode_dio_end(iomi.inode);
-	return ret;
+		return ret;
+	}
+
+	return __iomap_dio_simple(iocb, iter, &iomi);
 }
 
 #ifdef CONFIG_SWAP
