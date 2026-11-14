Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794633041;
	b=EYITf9P6ZaQGqxS5miQfOxkn0SWjC74bDssOLud1aaQ9GtkOdElc/OGZuoCWbUbsk4ec
	 VAhTY/3NHD/p/tEKgXefZ4V2pyYpk65XyEZdyyuAmwmN8+5vlz05fImzh4GqaW/96nXqE
	 KCvxGE9pL0JdBodFjYJKkzpaw9ZV4qtd+vtY9SMDr/gdWOfOYoctuSwG+6ZlT3bBoDTIi
	 RT3rNuYm6IB0LZ8bhxnz9e+gktjpp/w9A/dnSR4qm/kldFdm4+mhHM/UHQP7nCQZr6yUI
	 f7X9xRlVDEhqBI7bpQQlKoA53xX/o++WC3W8KbICqW6ISAhCDbTuNEUwoqvnkTJEQXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ob3egBMDWREMyKIFGAgfTNtbB0svXcBxgsRZj9sWFXs=;
	b=Scu93ZKpfQnItTYIhXxPXV4C91142S9xNFsA83snG/A4YQONdjKe7vnhu8yFdOI/ZhRQ
	 j5tPQIb4+qmDAdMAfzgwEHcCFT4gFExJYXdE4gpEEHDJ+Hjevoavf6q+TCD3OQBR16rvS
	 shZKXN5eHPElyV6x/ubb+xGT2B6MGwjCMJQreAWiKaW8pgkRCyxWXWOThenmZ4z15BuV6
	 KyDJCKqGgh/loAORADhZztOqST65tghV5KjhrHSrQKOrodxOTauxPVMdZ4OHh2ou8tNSg
	 HpTb9pK0Dqg6adB2GfDA1Ebdde83Qp2ck+m5GDXMGq9cETZkAWyd3ptYQTkuBMdGDmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d+tnPToF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF9606A329
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 05:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAF9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d+tnPToF
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so2854252a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 21:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794633039; cv=none;
        d=google.com; s=arc-20260327;
        b=Cm8WBRMim9vL5MDlQ47ec0S4S7fv+gkzvNEHrjUDlW+nA3RSjv4mlWmQ2nhkH+ypUN
         Ag3kG2gHkb8j5bpM7KJEw1ddc23M+guXMZNoHMJey7UAbtC/LA9B/Ez77IFtr3nyiVun
         0Wp9Adqt+v2nfixV9X6OqlCX8zPZS5nHE8om20kLYY6pazN0aCDXgoUrXm9nxE6vKVEE
         o76a9ooxhHLfwRuWC6jBuJSMmG4c3zvrdWR4Nx1+60DoU09fNdue6LIo45b5O5ho027e
         32OdEIZZZsGuLprT4dHZeyKT4j/7AShhbG9P7pFGqr3oTnx4UnXtt0PK1+gKlDOQDPMy
         DTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ob3egBMDWREMyKIFGAgfTNtbB0svXcBxgsRZj9sWFXs=;
        fh=z7tDljHsX8yzxdC9LRZPIRk+GZ1K6hHHWftZrmZ26l8=;
        b=Fc1LufOSq1qWHcqapdJKkbbRyqUXUUhh/hJrKLEOQ0ANaow5pp3mIU9vlLfXMeekQR
         G2x9wLAV0aFH7Cm09jbm6RKhdyBg3d/JoQ7qEaWrzHGQqElQMiDjnkRB0kpizOqyjOae
         JHwLuhMst0g3vIYdb11gwCFty9zIPnWqgd5t3wqevewFFVAYSbt2qp/jvGdrYJ5/jH4w
         xB6xioHzrOsSYfCrjhrxTSscrbmS7NDif0U82EQ280Iy8NAtjJ4HrcFomN6sQ1qDiOui
         tCoyfRbf9Qk8c1at/mtPRUN4vHUJl+BdA1mMqK1sZKe8i+te95M/TZKkVWE9oSAVZ8rU
         oMOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1794633039; x=1795237839; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ob3egBMDWREMyKIFGAgfTNtbB0svXcBxgsRZj9sWFXs=;
        b=d+tnPToF126Llxu5X/lTfTq8uomfSv1rD2ogDwJin6Ny+YgaR6DyCcOIraGRCUjQvM
         PUW5oq0k8zgp8+//VQq65bJx+0wq9/g4k88+JBr3olon85IMtmbSX9i9/c2DgN+si0wC
         7eDu+KmzXcPuXAfOU9Xq9RGmo8NFsPhzpFMBuR93Rq9nBJFi0ZATuzLDS3Q6UCnCjgMy
         fFmhtiHXwgIBSMCV/oiB81vnb7o+8Sd1mijCEEYS/2lsVxGd2IAa9hXnotQk9lFKa0yA
         9LYWbhphlO3hiZnU//UAk3f+sAMXXN2wdNEu4RC1LGVPBaW8D5nVmsWvkbfbumdGzKAl
         uUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633039; x=1795237839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ob3egBMDWREMyKIFGAgfTNtbB0svXcBxgsRZj9sWFXs=;
        b=2cUIU8AIYrEHC8KT8ZB1h01s/UVBUCzw1bhHe/KntVrzYZRSBEInZbyyUE1pztBfI8
         Y5Td+VtXjFcUuBulELij9G77fZrTVmBwQznhvQcr6//UOuotDX6EbUCwHMs4OLEiVsyc
         yhp3jPpm+sqOBtyFX23P8X0L7bXxLbiXKbhv4HWe34cNXD2xp+1bZpmVrZM/2L4Tgoog
         WS9eMzf1Zhm86tQa2I0ZIiBjSPseFbQiDtpj5nnnSju0HD0jMRIwcxzQ88xBRG1fA6Yq
         vDpNKVu9FDl3fhY4K2n58RyGFnz5sf+/0yCc97um8FdI2To7Zx10ko3xu8fOr3/mS49e
         24Ww==
X-Gm-Message-State: APuU4Z/oTzXJTEkrS0kHEO+8wZSbCq18Cdekn1v+6UGRraeqoYo7xkQz
	i61av+zuLe6zl2zqrP6JEakW8zoNtWllel62DV/UsQw/FPCVt5CvXkmcGfJ9XM8lh06ddEc7jP7
	53pxUEFcfMA6mOWh8I3wOkjQ+ffB+h5hLx+WaKJRVKxM4olaxbVZRwgA=
X-Gm-Gg: AYBFou3mEf9fl+Qm8DOD3MWfyryT+9TCGJ1Q2htoYoJYEk5ew4QMArMXkD2tsshbarj
	ZIrqm+j+dXOjaEmJnT+5ogQXKAU+F5kEJ5szbOVLaSupUFjptAkT6pvmF1DOI6ARDcGB7qeKLKT
	S23TpMBnpw5UapIB8gyGtPw+V6wheUQRlGWhVN5GuR0Kt7xPx4N9TLfOi3Gd/4CKs/mCpYjedFO
	KOFKqw9tANzCYEOBh5q9m/EL8B7JeOeC7F+E7WDXX2sfNIV5KYNp8ve+Rbcet6m9ssWZvfvv6G/
	mNSxFX4Ws99Es2cULUNjL/JIVtEFX+11qpqt1ZH95BFKKT9FUqFyxvYDxVHt5gxGKaXJv/N4eig
	XCZzPkFymk+4KUhF+viydP8acGuZi1DTEH4m86+pAyovMqc6qEVjG3Dkd+LUCOV1RcWz48Tzpze
	hCtmTGLU9z5DdkSj2LyjQoI5KVRw==
X-Received: by 2002:a05:6402:450a:b0:6b7:6485:23cf with SMTP id
 4fb4d7f45d1cf-6b7c0c71b38mr3747576a12.42.1794633039273; Fri, 13 Nov 2026
 21:10:39 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261114034901.107028-1-xiyou.wangcong@gmail.com> <sashiko-outbox-214131@kernel.org>
In-Reply-To: <sashiko-outbox-214131@kernel.org>
From: Cong Wang <cwang@multikernel.io>
Date: Fri, 13 Nov 2026 21:10:28 -0800
X-Gm-Features: AclHuK9b9YbnQrkMNNBhoXZWszfVxhoLcU0mX9oRO4yAMe-BoLYXAumd77k65Mk
Message-ID: <CAGHCLaQZkusf3a0sD4jSky=u09hpmc=_i+CYdZ_vPsJotTSNdA@mail.gmail.com>
Subject: Re: [PATCH] riscv: kexec_file: Keep segments out of the new kernel's
 PMD padding
To: sashiko-reviews@lists.linux.dev
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Song Shuai <songshuaishuai@tinylab.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Mike Rapoport <rppt@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Guo Ren <guoren@kernel.org>, 
	kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 7:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] kexec_file: missing placement bounds checks in
>   kexec_alloc_contig() [1]
> --
>
> commit e91ae0bea9270620f64704189d1d94046334bdb0
> Author: Cong Wang <cwang@multikernel.io>
>
> riscv: kexec_file: Keep segments out of the new kernel's PMD padding
>
> This commit aligns kbuf.buf_min in load_extra_segments() to PMD_SIZE so
> extra kexec segments are not placed inside the new kernel's PMD padding.
>
> > diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel=
/machine_kexec_file.c
> > index 26cd2a8bd0cd3..0d2d43a7dbfaa 100644
> > --- a/arch/riscv/kernel/machine_kexec_file.c
> > +++ b/arch/riscv/kernel/machine_kexec_file.c
> > @@ -251,7 +251,8 @@ int load_extra_segments(struct kimage *image, unsig=
ned long kernel_start,
> >       char *modified_cmdline =3D NULL;
> >
> >       kbuf.image =3D image;
> > -     kbuf.buf_min =3D kernel_start + kernel_len;
> > +     /* The new kernel reserves itself up to the next PMD boundary */
> > +     kbuf.buf_min =3D ALIGN(kernel_start + kernel_len, PMD_SIZE);
> >       kbuf.buf_max =3D PFN_PHYS(max_low_pfn);
> >
> >  #ifdef CONFIG_CRASH_DUMP
>
> [Severity: High]
> This problem wasn't introduced by this patch, but can kexec_alloc_contig(=
)
> bypass kbuf.buf_min and kbuf.buf_max when allocating a CMA segment for a
> non-crash kexec_file_load() [1]?
>
> Unlike locate_mem_hole_top_down() and locate_mem_hole_bottom_up(), which
> check kbuf->buf_min, kbuf->buf_max, and arch_check_excluded_range(),
> kexec_alloc_contig() only checks kimage_is_destination_range() (and passe=
s
> the exclusive end mem + kbuf->memsz rather than mem + kbuf->memsz - 1):

It looks valid to me. I can send a separate patch for this.

Thanks.
Cong
