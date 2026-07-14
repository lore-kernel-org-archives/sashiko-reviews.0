Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F844D031
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033486; cv=none; b=UDtwLulNPthOSfWy7O2F9HgibTyTu+HX+N5ym6NpCFZUq2baErzTK1iAlmt07VB+rvKPfAbSBCCrU7y+xxr5pRg9UqTKYhukA+wtBHYYzzDrGSQj7D7RlDLbSvyZaAI1r7SU9WnkoxTxwQ4QZIyqFW2T+S8AhsM3nrvnUQdW3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033486; c=relaxed/simple;
	bh=xMoUgN15xleiLnqYdHWTZOIfOUukA3nDykU5x7/6Z30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgyjEEBzpeOeIfh4o6kYVwYYnYCynFlkme9bTFEl0IOKj7/vLhMGjDmCTxcaazqviX1+AUVrMD6m7QEuawlEZ7ovJbVuAFjn4TTzyV4o5r+REDsb26M2x9GttpU8Kpp8nHmZKc96sKuuA2LCz/fenyrf2V05dezKA4GaKuKhf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hmMVJ/ZJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hmMVJ/ZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784033483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKvsaCFPRUFFmK/V3zdnhQnXrfEi6+6psRpCtWTwSfI=;
	b=hmMVJ/ZJiC+IjFlmXJ4fOzyLEhU7FVns/u1q1FvTROpoApcbz0hxEgzbAdFKbfW2td5lcD
	E4xSdaDMXlUm3JiPB6HcFLEMk4Z0P5IZ0GQ+wfJvpX0O8CjfM3fODvMk2o973AZR4ok/v/
	v8Zi8fgnnso/hIUx95JdeR57yp7x22c=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-9ifUqkEHPnuV7PbLZQYSjA-1; Tue, 14 Jul 2026 08:51:22 -0400
X-MC-Unique: 9ifUqkEHPnuV7PbLZQYSjA-1
X-Mimecast-MFC-AGG-ID: 9ifUqkEHPnuV7PbLZQYSjA_1784033481
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso1334341a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 05:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784033481; x=1784638281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKvsaCFPRUFFmK/V3zdnhQnXrfEi6+6psRpCtWTwSfI=;
        b=jVtGiqEPz49xJDuk2tQVA9NsEbg0DVltDLFSkCDY12edMiGxHvttQDq1oKrlRNBDqG
         X1DJvkKfwyPjfxvyC5RYhxnFogSosp48CB9U+06LjqMxuslcST47O2rDxTi9z9JQvIPs
         yWdscnzKT/j0ghl+IgkSNAW5HTHsrR9Us4ya8kzej+ERUYj0QsNJL6SUxlRZmc9ZppcM
         SLrA94FgDa+PtUVY5O+UDRgcClflfmJ1Pcfa4k7dIlEqxqK4qrNz6ZOhgIHjS7XoFtoB
         huTAg8e5ozsa3ex0+aTg8MZ6u2U+TMGvWxPrNwVoW6xhEpWSLU8imrH3SCiOzcdegJk2
         j48w==
X-Gm-Message-State: AOJu0YwEUU6pzSakXMleUX4bp4wbdSpdkMKVHdaQql+vK+Dd2//KrAMB
	Arxuo5qlbiQydjus5pp0aLhVgBqdtjIrVJaj47vsrkbyuFBxWeiK7CYrUTua6PhksyZXvYnkPhd
	Kbp0itceKhqtRDNQNZ7UH5GSgb0oTqtjYtEbf3PyIVj3LVNHLpiP2PpALx97f92He7K/SKPZV2K
	6/RL/nVT4s5VGfqHVEsZ7ftnNABaYs0uxOLNnu0Rq1BR8UZGKeWqX0
X-Gm-Gg: AfdE7clZDv1QFqbjfZewOwski6/zC1VCIPnjq8jEZ9tQYDsMM10ildro8YClcFMZdI2
	jK3WWRr9UCnwEHp3574xTWT4PL6tO0XUheYGkLeRGvs/rWZP8Em+fhd9hfkrIbr+Zi8YIFiySLt
	P6UvEDue+7rm+KHHT4oV1HCBx0YSEUaeovcIgEzAOgGiNR8CoXcw2iZ4xA4/m+6z5aouI=
X-Received: by 2002:a17:90b:224c:b0:381:b64b:5a28 with SMTP id 98e67ed59e1d1-38dc779eb0bmr10738696a91.30.1784033480621;
        Tue, 14 Jul 2026 05:51:20 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:381:b64b:5a28 with SMTP id
 98e67ed59e1d1-38dc779eb0bmr10738664a91.30.1784033480036; Tue, 14 Jul 2026
 05:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703114733.1243995-1-omosnace@redhat.com> <20260703115632.0761F1F000E9@smtp.kernel.org>
In-Reply-To: <20260703115632.0761F1F000E9@smtp.kernel.org>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Tue, 14 Jul 2026 14:51:07 +0200
X-Gm-Features: AUfX_mzIhLonpFxwa-SGutB3olap4kAGAGg8ITrb_wbekx7fRndFBruXmDdqBSQ
Message-ID: <CAFqZXNvckJRNYahj_wpoZ8zyt-PLug1+CA=CQpKaKZ7MVo6QoQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: fix incorrect execmem checks on overlayfs
To: sashiko-reviews@lists.linux.dev
Cc: selinux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YA6UAwFWUn3Sl99lFzdmzd697HKinKIc6paPHIadEV4_1784033481
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 2:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] SELinux uses `vma->vm_file` instead of `vma_is_anonymous()` to c=
lassify anonymous VMAs, leading to incorrect permission checks.
> --
>
> commit 2446671db8e6a83fbf4c3451f231d685bec26e4e
> Author: Ondrej Mosnacek <omosnace@redhat.com>
>
> selinux: fix incorrect execmem checks on overlayfs
>
> This commit fixes overlayfs mmap() and mprotect() access checks by skippi=
ng
> the execmem check in __file_map_prot_check() during a "mounter check". It
> introduces a boolean to indicate this state, ensuring the check is only
> performed against the calling task's credentials.
>
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index 0f704380a8c81..fca310b7270f3 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> [ ... ]
> > @@ -3988,7 +3989,7 @@ static int __file_map_prot_check(const struct cre=
d *cred,
> >                       inode =3D file_inode(file);
> >       }
> >
> > -     if (default_noexec && prot_exec &&
> > +     if (!mounter_check && default_noexec && prot_exec &&
> >           (!file || IS_PRIVATE(inode) || (!shared && prot_write))) {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is it correct to rely on
> !file to identify anonymous mappings here?
>
> Using a file pointer to check for anonymous VMAs instead of
> vma_is_anonymous() can misclassify mappings. A private mapping of /dev/ze=
ro
> has vma->vm_file !=3D NULL but is functionally an anonymous mapping. This=
 could
> allow an anonymous mapping to bypass the PROCESS__EXECMEM check.

I don't think this is a problem. There are only a few places where
vma_set_anonymous() is called:
1. mmap_zero_private_success()/mmap_zero_prepare() - this is only
called for MAP_PRIVATE mappings of /dev/zero, where execmem will be
checked if the mapping is writable. If it's not writable, it's the
same situation as creating an RX MAP_PRIVATE mapping of a file that
contains zeros - i.e. the ability to do this will be evaluated by
checking read+execute perms on the /dev/zero inode, which seems better
than treating it as an anonymous mapping.
2. do_mmap_private() - here it is only called when vma->vm_file is NULL.
3. __mmap_new_vma() - here it is only called when vma->vm_file is set to NU=
LL.
4. do_brk_flags() - here it is called for the heap VMA, which is never
file-backed.
5. create_init_stack_vma() - here it is called for the initial stack
VMA, which is never file-backed.

> This same pre-existing pattern appears in selinux_file_mprotect(), which =
uses
> !file to check for anonymous stack mappings:
>
> security/selinux/hooks.c:selinux_file_mprotect() {
>     ...
>     } else if (!file && (vma_is_initial_stack(vma) ||
>                 vma_is_stack_for_current(vma))) {
>     ...
> }

Initial stack shouldn't be file-backed, so that's a non-issue.

> It also applies the FILE__EXECMOD check to the backing file if vma->anon_=
vma
> is set, which would incorrectly check the backing device for /dev/zero:
>
> security/selinux/hooks.c:selinux_file_mprotect() {
>     ...
>     } else if (file && vma->anon_vma) {
>         /* ... */
>         rc =3D __file_has_perm(cred, file, FILE__EXECMOD,
>                              backing_file);
>     ...
> }

The LLM seems to be a bit confused here... The quoted code would check
against the user file (not backing file), and IMHO correctly so. If
the user privately mmaps /dev/zero RW, then modifies the mapping, and
then makes the region executable, it *is* essentially "executing" a
modified version of (possibly overlayed) /dev/zero. And the subsequent
check would then check mounter creds against the backing /dev/zero,
which is also correct.

I don't know, maybe mapping /dev/zero is so close to just doing an
anonymous mapping that it's a bit pointless to take its inodes into
account, but it doesn't seem outright incorrect to me, either.

--
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

