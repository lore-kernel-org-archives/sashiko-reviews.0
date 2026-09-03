Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E424B129F
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450877; cv=none; b=Ydn2Bs42NMcFJf88JC37SMjOym//6AcTDT+x8DzgESdEkQARmB8t9TdWBO2CHSVOkukMkZM+i+PIJwUu/EPtIPV8GMxYpjyjV8s+Vsg+mUCFjhKGZBnev001QhyLYkSAjV+Po6iuQSDLMxdvvC4gjBH1gCGWuIzcST3sZhFjaVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450877; c=relaxed/simple;
	bh=SkwS1obEXFRQQvMZKWNRCoBrZa5SCh4GtHmEQeCBxC4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Yy4UgOjo0xL/D2lxOuFvHUNILUhASWkPCAXW03z4Ke0GSVrUsXLXVIer9A1bXogPLI9Gk0PW6yxvnX3VXTtITiA8MrWmzVE/lecKW9Q/wrsUC+CE98MJlbIviZmr9cslZo8H/Cm/oIQrQqVN8ob2Z0HWq44C0EHQmU62xevE2T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxrIdrhL; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxrIdrhL"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b963f51f6so39855e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450874; x=1789055674; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8VbwdlqCQxfdIZO7e9acFweb5EzcAb7QaDyJJVU6kI=;
        b=CxrIdrhLND0uxjmszd1DG6zZTR49O+twdZW4HjoA9DBLRW6zIwYJPgbRI+KNdeL3w7
         O6O61v5Xkb65GsYuEPnJo0mS+NtI+t9n/NCKZ30VRm8aN0PO8nJEe1SaTiPiLahABYj7
         ZSEbgta0IuzwLow8Y0tAA4EXueAmUhvbp8JSW/cIgBGlb3Fg0JTOlOEG8gjkeo1ngAal
         D7kMfZSZXF5DyoeH3Tg/pRJbqAz7Vi2BNETUzF3c1fMvWnOJhtANAt4lTpSM+9FuwY0q
         JcEDWhq/Zjq9g3TWWO0NpGGgv1SicfrSB2iLkcrBsV9PQrI0J8esvN2KOo7H9Oxqv1zl
         8Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450874; x=1789055674;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8VbwdlqCQxfdIZO7e9acFweb5EzcAb7QaDyJJVU6kI=;
        b=c1QuONI2/0ItmDXxfRqxyuAq/9CeGuEuOlyPTYUQ3+8ZOZRLtN40hD2E3qg2bgiJPU
         zTi47JGuIyIy+ZHs4pK+poCZD/CFMzJoP3l2y1BcpfynA57GTDoltezCKV6f28CKLZdq
         9K8FvB8/gcfuJqHDTFpq5qkRd9ZYwVBoZLtBFFiJHdWIp72cGdtrfSJaBkgkBqALsTLy
         4rkRZqb09FdAsJcBEeHKk2gYlqWSHSNLQQ4xoz1IAbj+pxQ2F6mmPnB+KP+/BMBluCuH
         NCTRQ8VIM1+6R+TJcviPD5HNhYWr6QoCNbCNN3YAq+A9IRExiBczegHbzIUXn1lfVRAy
         iQvQ==
X-Gm-Message-State: AFuF++lOi+/K4r/j4YytmHP1Pmi1BHtkffnr/TEUTN+npC3CuHcRvcvR
	lcLVXuGMoNUpwwFRYtkFpnmab+M9GMNBML89U2l2fsqmPWD23L2sqGvtyF1CJZYH
X-Gm-Gg: AYBFou1HAQR44CkocQAi4yedxTXmsNtDpwXG8yn1HdZm8y8NYyThweg6IduG/qzJdlO
	elUFR0EcGq0p3K08CCsipMPeYu9SmtjLZq07f2iVffe9kfKDjFOV6p6Fnomt/3F9S4svtmYOmOC
	PUBMalEXTYlV38J28PEiSNaez4h3W48iPK3+yULom4HC95PsLGwSVRRzL6BkS6Y3ZU4klwG6fbn
	6efFzbpoitV46VnBkKpF2b+d5YeHFwiB4Qx12zqpVSeqJkXfByOvuMMst6rzcaREDH1m/UhjotF
	kw7X5ulMWaP8w5ejG49aUQwKNTL5nyPvXX3e5o4Bv03uLE7QvOjoRmHJLitfi31wG06DVIyJ+Nf
	kPJCDuiLoTHRqDOPdoH0x+X3R9qnSkX1krR1eWToBIfn68k9qcItGKsbUB7ngKcn9RDr9UBjHPq
	c2rz0f+tepVfsqldQyA60o9kfiNSS5W1Zi2l6APQBLxWj/Fc/4dkhuy/ZHknELOVDo6yVtpFPgi
	LZSazOq6JZBEQ1n/pnPIFuHcIoTKW20ukpYu39sjuXksPvqni2Ta7UwHL7kYAwROFQprdZ/weur
	2b/l8qp4/NnPFjm+qC6kLdUuFpU=
X-Received: by 2002:a05:600c:4692:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49ce57f569cmr198422585e9.2.1788450874124;
        Thu, 03 Sep 2026 08:54:34 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce591f846sm61152355e9.1.2026.09.03.08.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 17:54:33 +0200
Message-Id: <DL5SX8TPQZ4R.3TTGUMLHYKN4Y@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 09/10] bpf: Mark syscall helpers as sleepable
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260903144433.1716731-1-memxor@gmail.com>
 <20260903144433.1716731-10-memxor@gmail.com>
 <20260903155150.D57251F000E9@smtp.kernel.org>
In-Reply-To: <20260903155150.D57251F000E9@smtp.kernel.org>

On Thu Sep 3, 2026 at 5:51 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] bpf_btf_find_by_name_kind_proto lacks .might_sleep =3D true, all=
owing arbitrary FD injection via softirq.
> --
>
> commit 1d16e876066d61c09bcc6698ca694cdf8336d52c
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Mark syscall helpers as sleepable
>
> This commit adds the .might_sleep =3D true constraint to the bpf_sys_bpf =
and
> bpf_sys_close helper prototypes. This ensures the verifier rejects them f=
rom
> non-sleepable contexts, such as bpf_timer callbacks registered within a
> BPF_PROG_TYPE_SYSCALL program.
>
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index 6874ba1424af0..c7bc9ba9b331f 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>> @@ -6568,6 +6568,7 @@ EXPORT_SYMBOL_NS(kern_sys_bpf, "BPF_INTERNAL");
>>  static const struct bpf_func_proto bpf_sys_bpf_proto =3D {
>>  	.func		=3D bpf_sys_bpf,
>>  	.gpl_only	=3D false,
>> +	.might_sleep	=3D true,
>>  	.ret_type	=3D RET_INTEGER,
>>  	.arg1_type	=3D ARG_ANYTHING,
>>  	.arg2_type	=3D ARG_PTR_TO_MEM | MEM_RDONLY,
>>  	.arg3_type	=3D ARG_MEM_SIZE,
>>  };
>> @@ -6593,6 +6594,7 @@ BPF_CALL_1(bpf_sys_close, u32, fd)
>>  static const struct bpf_func_proto bpf_sys_close_proto =3D {
>>  	.func		=3D bpf_sys_close,
>>  	.gpl_only	=3D false,
>> +	.might_sleep	=3D true,
>>  	.ret_type	=3D RET_INTEGER,
>>  	.arg1_type	=3D ARG_ANYTHING,
>>  };
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does
> bpf_btf_find_by_name_kind_proto also need to be marked as sleepable?
>
> Looking at syscall_prog_func_proto() in kernel/bpf/syscall.c,
> bpf_btf_find_by_name_kind is also exposed to syscall programs:
>
>     case BPF_FUNC_btf_find_by_name_kind:
>         return &bpf_btf_find_by_name_kind_proto;
>
> Because bpf_btf_find_by_name_kind_proto in kernel/bpf/btf.c lacks the
> .might_sleep =3D true constraint, the verifier will permit its use inside=
 a
> non-sleepable bpf_timer callback registered by a syscall program.
>
> When the timer fires in softirq context, bpf_btf_find_by_name_kind() call=
s
> __btf_new_fd(). This attempts to allocate a file descriptor with GFP_KERN=
EL
> and injects the new file descriptor into the current->files struct of
> whatever arbitrary process was interrupted by the timer.
>
> Should bpf_btf_find_by_name_kind_proto be updated as well to prevent this
> cross-process file descriptor injection and scheduling-while-atomic issue=
?

Yes, this also looks broken. Will fix after this set lands.
