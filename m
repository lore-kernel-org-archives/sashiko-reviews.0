Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CE38DC64
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612699; cv=none; b=LQAb86dIgUIyCzSvUOXvMco6R3WNROHcmebd/6qmgyKDIQhFKvRgrsi7h/hVF1bXJ6nScjGoJqOJekvt1kdfHteYHrWTRbrQ0SBhKk8wXceMdddl/7/MZCnjKupZdZ8YmVrG83hOyqIgRbHeFBRgPizlPBPECFtt9dNDfWS8yFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612699; c=relaxed/simple;
	bh=/B2PH7sxPk/r/1l/R0apQVAEoU1E/EeTvyaEaP69O7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6p8aNKCKURpgwEQBt7EWn4I0gfF3D9D1/lj/mA1aV04etMlr8FtexV4156p5OfwuuLTUEeIMxQLdRiJ2AdndFV+NSur23/LSmBWONSzj0ejh5o9WTD64g8eMzNkyzRpym/Ym1Yu2CW/Xs70rrjv7scdejteFP4l81T3SsjAefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oTDldnqx; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oTDldnqx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789612684; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=opLG/yvPapch9ArVQc4UdgHYvo5vPQt5cjIMPw7qKmo=;
	b=oTDldnqx9SjWo4cCeCSltB0o7uMLXC+QwDO5UqameGIXyTpWaeA54ntCLC4rnSdpZNNXAPI8DXRS4TjSJa/VWrm0tY148C4XH8e9n6uJstG8pMx4rTL3iKLg05yjScHX5pcrD5FwpsFlry7mrlJgDHUqoNO9QrikYg/CXEKAoL4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XB6Q.Q5_1789612682;
Received: from 30.221.129.217(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XB6Q.Q5_1789612682 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 17 Sep 2026 10:38:03 +0800
Message-ID: <5f38b69d-2759-44bc-bbd3-1a83dc11343e@linux.alibaba.com>
Date: Thu, 17 Sep 2026 10:38:02 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ocfs2: retain all security xattrs during inode
 creation
To: sashiko-reviews@lists.linux.dev, Andrew Morton
 <akpm@linux-foundation.org>, Heming Zhao <heming.zhao@suse.com>
Cc: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mark@fasheh.com>
References: <20260917014825.678947-1-joseph.qi@linux.alibaba.com>
 <20260917015825.A4BE61F000FF@smtp.kernel.org>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20260917015825.A4BE61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/26 9:58 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ocfs2: BUG_ON() in xattr index creation due to unallocated bucket
> --
> 
> commit cd302f8c577646bddd492b0e34b4efe956759c91
> Author: Joseph Qi <joseph.qi@linux.alibaba.com>
> 
> ocfs2: retain all security xattrs during inode creation
> 
> This commit modifies OCFS2 to store all security xattrs returned by the LSM
> framework when creating a new inode, instead of just the first one. It copies
> the names and values, calculates the necessary credits, and writes them all
> within the same transaction.
> 
>> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
>> index a2d6c3d0f2e8d..25fb23cc00d2d 100644
>> --- a/fs/ocfs2/xattr.c
>> +++ b/fs/ocfs2/xattr.c
> [ ... ]
>> @@ -663,14 +668,27 @@ int ocfs2_calc_security_init(struct inode *dir,
>>  		*xattr_credits += OCFS2_XATTR_BLOCK_CREATE_CREDITS;
>>  	}
>>  
>> -	/* reserve clusters for xattr value which will be set in B tree*/
>> -	if (si->value_len > OCFS2_XATTR_INLINE_SIZE) {
>> -		int new_clusters = ocfs2_clusters_for_bytes(dir->i_sb,
>> -							    si->value_len);
>> +	/*
>> +	 * when blocksize = 512, the security xattrs may not fit in the
>> +	 * single block reserved above and a bucket has to be allocated
>> +	 * for them, so reserve the cluster it needs as well.
>> +	 */
>> +	if (dir->i_sb->s_blocksize == OCFS2_MIN_BLOCKSIZE &&
>> +	    s_size > OCFS2_XATTR_FREE_IN_BLOCK(dir)) {
>> +		*want_clusters += 1;
>> +		*xattr_credits += ocfs2_blocks_per_xattr_bucket(dir->i_sb);
>> +	}
> 
> [Severity: High]
> Is it possible for the total size of stacked LSM xattrs to exceed the capacity
> of larger block sizes as well?
> 
> With stacked LSMs, if the combined size of the security xattrs exceeds the
> available space in a single xattr block (even for block sizes > 512 bytes),
> this condition will fail to reserve the necessary cluster and credits.
> 
> Consequently, when ocfs2_init_security_set() loops over the xattrs to write
> them, it may run out of space in the block and fall back to creating an index
> block.
> 
> Since ocfs2_xattr_set_handle() also assumes buckets are only needed for
> 512-byte blocks:
> 
> fs/ocfs2/xattr.c:ocfs2_xattr_set_handle() {
>     ...
> 	if (inode->i_sb->s_blocksize == OCFS2_MIN_BLOCKSIZE) {
> 		xbs.bucket = ocfs2_xattr_bucket_new(inode);
> 		if (!xbs.bucket) {
>     ...
> }
> 
> This will result in xbs.bucket being NULL. When the index block conversion
> is forced due to ENOSPC, it triggers a BUG_ON(!xs->bucket) inside
> ocfs2_xattr_create_index_block(), causing a kernel panic.
> 
> Does this same limitation also affect the identical block size check in
> ocfs2_calc_xattr_init() when calculating credits for combined xattr sizes?
> 

It seems a false positive. The BUG_ON() looks not reachable on this path
at any block size. So I'd rather leave it as of now.

Thanks,
Joseph

