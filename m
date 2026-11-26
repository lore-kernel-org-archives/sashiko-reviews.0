Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733426;
	b=Xc2e78VEbzN9zvMmlXJN7CXadjkqdIdcvBhLh4L7e7GCR3UZdy08EtRe4/dWo93jxFZ0
	 Zlb8Z2h701hEF6ReVj+b/BHjAVC+ShvBHA5SJJnQAVjGT9mnP/PO5bkJVxnzF+5llIdMF
	 Skh/yR8q/7HbhDeBzC7rgThayVcLPSADGP+MQE1Zw96EWFOTj2OGfv5DUdMgGtcR+6ESd
	 nOlSyoF6+gh8B7pGv+ORzdN+BCk1qy/7XtTxMdkDJpYirbYcC/DaFkrsIsn3/TsHZu7Gu
	 PsREQ0b2TBZ4YAXi9OTiZAfLM56aU4dTaBCQ4HEEO2EAje1Aui/tBS7xxCGx8rphJHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733426;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type;
	bh=XJHUUqPJG742vUDQC9wjPH1jIvh4bumyltu7WWZvqTQ=;
	b=JurHRq20x72u6BHtOV2s+08X6mUmIyRwlI/N0XTCyW/gzvmV37W3RvlBvYStg5ODtsqm
	 lHvHXl3+0kh4ASi6ubz2eC+HPTpj1+lZtdVoWB4Ulb80MVE4ySz6FrAT2NFxeGLe1QqVN
	 dTU50/9YwCeNDgIcyjrr9bp7890NHSkRYep9UoF0Wq555LRuXttXIFgvdQrSZIBphV4dT
	 eX+y51KeSvFjvyOlPG8p7JcE3DFKIo2psUHB1vsagEWThJ1FzOU5u+vnsF5kcD7mVioNl
	 J0KPg8T1rsXqwU5GvQMzp4BNuc93KFTCnY5vC4E+YZDYf+awY9fMTrR8U6vY744rWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hpEPG1m8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1C606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 22:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hpEPG1m8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795733425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJHUUqPJG742vUDQC9wjPH1jIvh4bumyltu7WWZvqTQ=;
	b=hpEPG1m8aAOHMB6Dgs/8RZljY5UJkzoD86aYHbK54TO8xAHXsRcnsWukfqF/Y7yu6avGdY
	TcFPTAJqmIaeMnWbgB9/XguSA2B52WA5aPphHGaFHW25m5iWEFLrDNYbgEl7xVhVZs8Wze
	rvTDCebIPQWqJIDLXQ0s2AcJ9ZCSIEQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-ZX8Ar5ViNMeKWuhUzTNrZA-1; Thu, 26 Nov 2026 22:50:23 +0000
X-MC-Unique: ZX8Ar5ViNMeKWuhUzTNrZA-1
X-Mimecast-MFC-AGG-ID: ZX8Ar5ViNMeKWuhUzTNrZA_1795733422
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0e878f574so109131127b3.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 14:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795733422; x=1796338222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XJHUUqPJG742vUDQC9wjPH1jIvh4bumyltu7WWZvqTQ=;
        b=jgmZJstBWfigzNbv5eCwZuv4zoA7VLJpwlY+SB5gvfQNlmozdd6kogafpcEtsrKgXH
         pbLy84p3XO1TXkB7KjB1ho5L+ykBvrhnP7c2v15p177YAfsAsY0HFrtTdAuIkpBE1i/9
         I1w16w2Nvp1+CfsLGWfBx2gL+rWukokeO8gC5Tmg+4f6gvScOpPbsjZPi3tZezAwaw5b
         yYEdp80V0qmArjh8QVODjHQdq0VNloXiOq1G9rslBvMd4ImVjE6z48W0RNDpkmiq9SiO
         DJYBXxmSY8yxltYzBjlECHv/EJjcqH8LWhzDy7UgyoJqtULZGTqfH4g4Exa8PHB8p5Kg
         B0WA==
X-Gm-Message-State: APuU4Z+meaCOTO08LNpbiBUC9JJQuo4GKKbEIMq0Qn1RGkF+PaGY8zyt
	f7Lh7XjPh6niXXENHTBJMlSwHsJlFWd4zkkqWRzw4pRDAoJT4V52wfo4ggMO2dJHEI3+ZJYJRcn
	OKCgzZuOYkJ6SjiCV3CR2EXnLgEr6HIPvAEoNl5MsFnE1RV8KaxcW5uZvkIMXMIMGH3wA4Fj7hX
	e9CwjEpac/ZhFO6Du2zOP46Gxz8c4wbZWHxyo0t0pevkzo
X-Gm-Gg: AZFdTZcOtw/zuGWf8vQYABYvsnirE7NILcEs2m+CE5mxnz1Ien7Douhql/4aP0ixnQt
	vmSZDohX0pO7afSDeaQ5hl+FXQrlco9AtaQugqFkMcUK7VOPL8+WQrKKlq/CNUS09IVePFc/tmi
	VJHRpTR6IjhN1jhkq5aDTwn96pb4IcbgZH4j8a2DKGiS2Dyeaxm+sXSUzTGnzLMD0U4tENjznmg
	wlrhx5w/+DZw2zEWR/l52VhqKHFVPWmbfja4BDxXEoXrw==
X-Received: by 2002:a05:690c:4507:b0:8b3:150b:43e1 with SMTP id 00721157ae682-8b5204b0e0cmr90968647b3.21.1795733422523;
        Thu, 26 Nov 2026 14:50:22 -0800 (PST)
X-Received: by 2002:a05:690c:4507:b0:8b3:150b:43e1 with SMTP id
 00721157ae682-8b5204b0e0cmr90968587b3.21.1795733422097; Thu, 26 Nov 2026
 14:50:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
 <20261124-gfs2-log-folio-v2-1-f229e90c8285@columbia.edu> <sashiko-outbox-232028@kernel.org>
 <3f099de2-4fbb-45b0-ba7f-3a20f6ec7e4a@columbia.edu>
In-Reply-To: <3f099de2-4fbb-45b0-ba7f-3a20f6ec7e4a@columbia.edu>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 26 Nov 2026 23:50:11 +0100
X-Gm-Features: Aa3M54orVwIjaRZfOs4hjRst8QmWhhTw8ndi0KtUDhIgN5-JL5xTvUFzOA8PpQc
Message-ID: <CAHc6FU4=F69DBO9GRAV+2Aoc4mDDp8Sr8A0aDE-Bpbf1_h+jhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gfs2: make the log page pool per superblock
To: Tal Zussman <tz2294@columbia.edu>
Cc: sashiko-reviews@lists.linux.dev, gfs2@lists.linux.dev, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xz1KRjH-O-RfzxleetQJoB1bSO8dXl2vO8Pg0WVAAgI_1795733422
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 22:55, Tal Zussman <tz2294@columbia.edu> wrote:
> On 11/24/26 4:16 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [High] gfs2: use-after-free on sd_log_buf_pool in gfs2_end_log_write()
> >    after free_sbd()
> > --
> >
> > commit 6dc37dfa05bee3bb13ea4a43812ebcbe3533794a
> > Author: Tal Zussman <tz2294@columbia.edu>
> >
> > gfs2: make the log page pool per superblock
> >
> > This commit replaces the global gfs2_page_pool mempool with a
> > per-superblock sd_log_buf_pool initialized in gfs2_fill_super() and
> > destroyed in free_sbd().
> >
> >> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> >> index 6ec47376aecf2..f62a893ce5a2b 100644
> >> --- a/fs/gfs2/ops_fstype.c
> >> +++ b/fs/gfs2/ops_fstype.c
> >> @@ -67,6 +67,7 @@ void free_sbd(struct gfs2_sbd *sdp)
> >>  {
> >>      struct super_block *sb = sdp->sd_vfs;
> >>
> >> +    mempool_exit(&sdp->sd_log_buf_pool);
> >>      free_percpu(sdp->sd_lkstats);
> >>      sb->s_fs_info = NULL;
> >>      kfree(sdp);
> >
> > [Severity: High]
> > Can free_sbd() destroy sdp->sd_log_buf_pool and free sdp while log bios
> > carrying pages from sd_log_buf_pool are still in flight?
> >
> > Previously, gfs2_end_log_write() returned pages to the global
> > gfs2_page_pool, which stayed alive until module unload.  Now it calls
> > mempool_free(page, &sdp->sd_log_buf_pool), while free_sbd() runs
> > mempool_exit(&sdp->sd_log_buf_pool) and kfree(sdp) without waiting for
> > sdp->sd_log_in_flight via log_flush_wait(sdp).
> >
> > Two paths can reach free_sbd() with log bios still in flight:
> >
> > 1. During journal recovery, clean_journal() calls gfs2_write_log_header(),
> >     which allocates a page from sdp->sd_log_buf_pool and submits
> >     jd->jd_log_bio asynchronously via gfs2_log_submit_write() without
> >     calling log_flush_wait(sdp).  If a subsequent step in gfs2_fill_super()
> >     fails after journal replay, or a read-only mount that replayed a
> >     journal is unmounted (where gfs2_put_super() skips gfs2_make_fs_ro()),
> >     free_sbd() runs without log_flush_wait(sdp).
> >
> > 2. In __gfs2_log_flush(), if the filesystem is withdrawn after
> >     lops_before_commit() or gfs2_log_submit_write() has submitted bios
> >     with pages from sdp->sd_log_buf_pool, it jumps to out_withdraw and
> >     skips log_write_header() and log_flush_wait(sdp):
> >
> > fs/gfs2/log.c:__gfs2_log_flush() {
> >      ...
> >       lops_before_commit(sdp, tr);
> >       if (gfs2_withdrawn(sdp))
> >               goto out_withdraw;
> >       if (sdp->sd_jdesc)
> >               gfs2_log_submit_write(&sdp->sd_jdesc->jd_log_bio);
> >       if (gfs2_withdrawn(sdp))
> >               goto out_withdraw;
> >      ...
> > }
> >
> >     Subsequent unmount flushes return early because the filesystem is
> >     withdrawn, so free_sbd() is reached while those bios are still in
> >     flight.
> >
> > When the bio completes after free_sbd(), gfs2_end_log_write() hits a
> > use-after-free on sdp and sdp->sd_log_buf_pool (or dereferences NULL
> > pool->elements inside mempool_free()).  Calling log_flush_wait(sdp)
> > before mempool_exit() in free_sbd() would ensure all in-flight log bios
> > have completed.
> >
> This is mostly pre-existing (and the same issue as the other Sashiko
> report), but I can add a patch at the beginning of the series to fix it.
> I think adding a log_flush_wait() at the start of gfs2_jindex_free() should
> be sufficient.

Yes, it's a pre-existing problem. I've pushed a partial fix to for-next for now:

https://lore.kernel.org/gfs2/20261126224415.3049791-1-agruenba@redhat.com

Thanks,
Andreas

