Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622664;
	b=zkbxYEB3UK9ZQ9xPCgtgu7AoD3gQdiKZu2dNG3KGJhGp6kOBjX7X0ymkj2gCeFA+8he4
	 5VjTeLI/9EJigXLyu5ImkNUgU/ox8Swjqja0r1f9up3pRx/obGqMAyrgQu8mVe2LCvMjE
	 668Ei3cRXcE0nCpLTlBYa2CCB5OtVCRQpPtwX1lPCd3wElBnh+CBA8HY2TVKNsBowDRwl
	 /TPLbxlZ7zcdzX3XRKqcOzo24ykfeUgD4pwdu+ygmPsUZWUmEdJMiS8l3rSSZzzquHg3f
	 lutVGZUE7obMyTi4YOtlBZImalRJDJbUr9Lv2Z48jS1HjbhVsA9AOb/Y23b8syI+5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622664;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=atoeJGeqv0Z1R919+9aEtspWeeQpp92iU9wLTusAw7c=;
	b=kNp2YnqRXxUtrCs0j6rjg1mFDwHy1p0vZSJR41pEqgWO1DZmNCzHw+k6ujKfz021Yjo3
	 rhGDno0bjJfZgCuvfYW+SJLJdgQ9toKoro1Yob5AJ8XtCAjaM96eWbjxKGMBeTj7QqFSm
	 wBJmkH0NBPHf+TpHQQj6HAvKyx1sBN0YEgltGjcTaP/s+I6D8mSCZN3K2OpW7P3dvXE+u
	 in7ji+GwnqBI9xaOYFDYMylxHXblYxTWiexQ2DvwrE06yBV+30xslHPtywceb0Ujkg2r/
	 OCXrqBfrGLrG4TAv0XrxE7QYkKZPtwaigsnanhe/GY9J4yY1XBWqi/hwKJzPE4hrcnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HITeYEW3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10437606A334
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 12:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10437606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HITeYEW3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793622663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atoeJGeqv0Z1R919+9aEtspWeeQpp92iU9wLTusAw7c=;
	b=HITeYEW34W453rANa11HgaxcJTL3kzPRpHJOyo7jMVGxgekr2ZWqFFBE/3oRGpCfTf1Z+B
	zPPSJj8icUm37kvTo4OleSOzo16jbdLXI6vko6V+Ik5koySlwzx2R+TBtmlELWUdd5byLZ
	vtoJCbSEYz0H6+w2IBVePtpazsQeA0I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-_DK6SIw8NaaNoo4naz4ysg-1; Mon, 02 Nov 2026 07:30:59 -0500
X-MC-Unique: _DK6SIw8NaaNoo4naz4ysg-1
X-Mimecast-MFC-AGG-ID: _DK6SIw8NaaNoo4naz4ysg_1793622658
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1bc2e62d5so3557962a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 04:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622658; x=1794227458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=atoeJGeqv0Z1R919+9aEtspWeeQpp92iU9wLTusAw7c=;
        b=zB+pdwT93jqJEtlOHZ2S87rD1eIhokS+T/9LSPzwDLBX7aUrbZ1oKwFdhG3FkbEjS+
         xu1CURFPf0iV++8McHFeNVO8zdahNHt7hxR2lXXvBf4d7SJiLWa2shb8dcoETApmux5f
         adBOxJpAgyrter5wqw3GOiHNEcHi3qL0AcnAI9DZMnZUoxGaI8lKb5x4UjeamnOmKDni
         3u09py6iKjlLiMW7NG4B1UDqpv1yWguT5KocDpirTtDVXEMisPDIw/dLjC4el7c55s3u
         7kHXA6dLCtCEXcf8+sn9w3/RqGHIbOTCqAGpbRN/twGOHwXMuTXKFrgqcwWtF6+RHe1G
         o96A==
X-Gm-Message-State: APuU4Z+r3/JbcXDzvdbb9rE4GMOQFujQoIgbCRrSocviRdWG0epcItnz
	7+wNbuYzagwvwjI+4TwTOE/b1jOJO7ra/uj+/MUOfEeeQVLNTsREy8x55leB+HrpEfzJkNMkYbi
	p1EHA/sIEVs2MhYnGC3VM0P3NnUqG2CgLHgdOML71ueFCC6TP0r8hajwBSpwswEo60ABzTcmuNB
	3FL+57VUcHWUueuZLSe25egqD6W2xV8tSlcGrb1GgfzUSluyk=
X-Gm-Gg: AYBFou0Ctngf/GkfEjeQYSxB5CuXl/+tMvVkynbRt/Q92SuQRVVMQbVHnO/JNlcTclZ
	XcnOMRidaUlpcKpXsFAxpipoq+xR0w9H6N9mNEqyGszB94CDqaKYaPHtUVUIwNVoB6UEldsSj1G
	j3XG6HH3kkcHEGdG6JaQsEgRk9GS574+O88jNcTzku+w2G8BLO2R/1HC4OLveEBWlaXPXgE1TOC
	olcnh1Akbxug4bYK1G3zl7Vi/zFMhYvBslkImKi+Q1RcNx+RtM0g+DqMPMVnZglEOletfwRbOUE
	0MMkQSgm0o/TMY0Ouq9XGa/izWhvOUYJ33vBkHS99O2qN59lmzfwDLw3ei4JDthEhCcTnP8Z8dm
	UfWey0IGe1lRfXpyiW1a45TAfFBL7C43+9LI1LEuHjg==
X-Received: by 2002:aa7:c0d7:0:b0:6b3:d0a0:39e5 with SMTP id 4fb4d7f45d1cf-6b4d438bdb7mr5044951a12.9.1793622658327;
        Mon, 02 Nov 2026 04:30:58 -0800 (PST)
X-Received: by 2002:aa7:c0d7:0:b0:6b3:d0a0:39e5 with SMTP id 4fb4d7f45d1cf-6b4d438bdb7mr5044928a12.9.1793622657746;
        Mon, 02 Nov 2026 04:30:57 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b51adb58e0sm1095546a12.12.2026.11.02.04.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:30:57 -0800 (PST)
Date: Mon, 2 Nov 2026 07:30:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karthikeyan KS <karthiproffesional@gmail.com>,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	Eugenio Perez <eperezma@redhat.com>
Subject: Re: [PATCH RESEND] vhost-scsi: use FOLL_PIN for DMA page pinning
Message-ID: <20261102073033-mutt-send-email-mst@kernel.org>
References: <20261020182640.2048506-1-karthiproffesional@gmail.com>
 <sashiko-outbox-180555@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-180555@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jxboNgvuG2QxDnK0DhberZIAEVPReUjbEiV_H5y0Ldg_1793622658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 06:27:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] vhost-scsi: page pin leak in vhost_scsi_map_to_sgl() error path


Karthikeyan were you going to address this review?

> --
> 
> commit 1042924e4de0195bca9a4409c2fafbb0c7c58e45
> Author: Karthikeyan KS <karthiproffesional@gmail.com>
> 
> vhost-scsi: use FOLL_PIN for DMA page pinning
> 
> This commit switches vhost-scsi from iov_iter_get_pages2() (FOLL_GET) to
> iov_iter_extract_pages() (FOLL_PIN) when mapping guest I/O buffers into
> scatterlists, and updates the teardown and error paths to unpin the pages
> with unpin_user_page().
> 
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 885fac5ed042e..8162d83bdfcc9 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> 
> [ ... ]
> 
> > @@ -842,9 +851,9 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
> >  	size_t offset;
> >  	unsigned int n, npages = 0;
> >  
> > -	bytes = iov_iter_get_pages2(iter, pages, LONG_MAX,
> > -				VHOST_SCSI_PREALLOC_UPAGES, &offset);
> > -	/* No pages were pinned */
> > +	bytes = iov_iter_extract_pages(iter, &pages, LONG_MAX,
> > +				VHOST_SCSI_PREALLOC_UPAGES, 0, &offset);
> > +	/* No pages were extracted */
> >  	if (bytes <= 0)
> >  		return bytes < 0 ? bytes : -EFAULT;
> >  
> > @@ -867,7 +876,7 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
> >  		    cmd->tvc_sgl_count > BIO_MAX_VECS) {
> >  			WARN_ONCE(true,
> >  				  "vhost-scsi detected misaligned IO. Performance may be degraded.");
> > -			goto revert_iter_get_pages;
> > +			goto revert_iter_extract_pages;
> >  		}
> >  
> >  		sg_set_page(sg, pages[npages++], n, offset);
> > @@ -879,14 +888,17 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
> >  	*sgl = sg;
> >  	return npages;
> >  
> > -revert_iter_get_pages:
> > -	vhost_scsi_revert_map_iov_to_sgl(iter, *sgl, sg);
> > +revert_iter_extract_pages:
> > +	vhost_scsi_revert_map_iov_to_sgl(iter, *sgl, sg,
> > +			is_prot ? cmd->tvc_prot_need_unpin : cmd->tvc_need_unpin);
> >  
> >  	iov_iter_revert(iter, bytes);
> >  	while (bytes) {
> >  		n = min_t(unsigned int, PAGE_SIZE, bytes);
> >  
> > -		put_page(pages[npages++]);
> > +		if (is_prot ? cmd->tvc_prot_need_unpin : cmd->tvc_need_unpin)
> > +			unpin_user_page(pages[npages]);
> > +		npages++;
> >  		bytes -= n;
> >  	}
> >  
> 
> [Severity: High]
> Can the cleanup loop at revert_iter_extract_pages in vhost_scsi_map_to_sgl()
> leak a FOLL_PIN page pin on the last page in pages[] when the misaligned-IO
> check triggers on the first iteration with a non-zero offset?
> 
> In vhost_scsi_map_to_sgl(), iov_iter_extract_pages() extracts and pins
> DIV_ROUND_UP(offset + bytes, PAGE_SIZE) pages into pages[], where pages[0]
> only covers min_t(unsigned int, PAGE_SIZE - offset, bytes) bytes starting at
> offset:
> 
> 	while (bytes) {
> 		n = min_t(unsigned int, PAGE_SIZE - offset, bytes);
> 		...
> 		if (!is_prot &&
> 		    (offset & (SECTOR_SIZE - 1) || n & (SECTOR_SIZE - 1)) &&
> 		    cmd->tvc_sgl_count > BIO_MAX_VECS) {
> 			WARN_ONCE(true,
> 				  "vhost-scsi detected misaligned IO. Performance may be degraded.");
> 			goto revert_iter_extract_pages;
> 		}
> 
> 		sg_set_page(sg, pages[npages++], n, offset);
> 		sg = sg_next(sg);
> 		bytes -= n;
> 		offset = 0;
> 	}
> 
> If this check fails on the first page (npages == 0) when offset > 0, it jumps
> to revert_iter_extract_pages before bytes is reduced by PAGE_SIZE - offset
> and before offset is reset to 0.
> 
> At revert_iter_extract_pages, the loop steps by PAGE_SIZE instead of
> PAGE_SIZE - offset:
> 
> 	while (bytes) {
> 		n = min_t(unsigned int, PAGE_SIZE, bytes);
> 
> 		if (is_prot ? cmd->tvc_prot_need_unpin : cmd->tvc_need_unpin)
> 			unpin_user_page(pages[npages]);
> 		npages++;
> 		bytes -= n;
> 	}
> 
> When offset + bytes crosses an extra page boundary (for example, offset = 3840
> and bytes = 512, which pins 2 pages across the boundary while bytes <=
> PAGE_SIZE), the loop only runs DIV_ROUND_UP(bytes, PAGE_SIZE) iterations
> instead of DIV_ROUND_UP(offset + bytes, PAGE_SIZE) iterations, leaving the
> last page in pages[] pinned.
> 
> Should the cleanup loop account for offset on the first iteration (using
> min_t(unsigned int, PAGE_SIZE - offset, bytes) and then setting offset = 0),
> matching the main loop?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261020182640.2048506-1-karthiproffesional@gmail.com?part=1

