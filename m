Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13542FD1DA
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358628; cv=none; b=E+WGQjBrtSLnP12I2BpPc2L2jQDFMAW0HICMjwxRHdCf7AIeP2KgRaTyRDXu2xtODT/u0GwmZiW+qFuhFVmU9UOM55FdRYsk85kbsQC5BJOeRHX1TBwtnE2xiew28jt2GkDT9FOId1hGNxg4yMHzFQ0TsbxulvWRbjESAma+Jgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358628; c=relaxed/simple;
	bh=gTVwqpZagZa5mCYibePx2zbeiV2CRsJsiELTP61LUSM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OaI2ggKJNsyE9dq7rAi7FBzF4Ayfo8AS6bOBO2ZsmiVZSoYvkDp6fG3w5EecfKG8B5NHCO01DWW7A40kmjnRyvBu6cmveknSTv8tBTKF9XbDn53VQEc3lGdh7ZVxTzQLApHpMt76uhc7CCSptc40PIzPz0BLwPtt8QrHir9bOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7+4wMLG; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7+4wMLG"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-47c7b282e21so2414559b6e.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 03:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779358626; x=1779963426; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76R8gX0FEqbjjjAZsnw+EspUsb2+PAhzM0rQupZXg5c=;
        b=b7+4wMLGNaqKd6B8uKUiorKR00hJjIhVygmhOKQYyQgZgcZFgpRVclo2VSK4SKvVI1
         gi+ls1w9Cnyc4DStD1MQdIhGtfx4vcCzRqVHt0ybLBrVL9lDWhBDMsv4KIrC1cSyMT1Y
         4EfbHV4ZM57/eLGgCsguuV2QtQ4rjQY5LBI/XW5/FtxpGJnCJTJYL5I1ubkqBpay5nj/
         tsSPXulktnlIiuR/AU6a1OJbd2ZYLCWMI6Utwce7hDEiHVS2NRb0TblC4lwyTOLXGLpW
         W+H1ysLUslmZyCd7VSInbvYmtyxG9Bw1TRyG/uTHL5qZDAcn3oWhwf3iXBwWKbBVLZAD
         h5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358626; x=1779963426;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76R8gX0FEqbjjjAZsnw+EspUsb2+PAhzM0rQupZXg5c=;
        b=LmROxhDgQxuvjz5v5g8gnp5mSKxYijT/LCc/569cZ1z1/hqnyYbjW1GGWenr5tgAA9
         Ib8nLgehsUiY85lSl7iyXuQPlt0F54dBuDh0pyhe95rdI2M6fjwFUfxHkeM8uN25gOyn
         PI8iWD/PnHZjERPh9u65ggS7Um9GUw/Pwkyj7v73Npatw4lsCAue46fSyiaCdaZtkYZ2
         laYvfjaaOwUQW+icTLS57F9vLU37CJyFhJn02E600ipfUbKkeLz5YvpOKigCjlL5ayvi
         fp+76vAfxIYtZsWKIGCRXJdjtrnOymUoTGwWNC4BvcM8vnL1MD6EMomvr/01qC7dxgSM
         Lrjg==
X-Forwarded-Encrypted: i=1; AFNElJ+z+xuab8ZRFxHwRiDRXfNsqCHp9gAUsNWmXfi35t4g85rnWOshE9dZwojIImc9Ae6j0SKiRt41Czkxed+VT+o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOUc+ZMNR8tjn4laleRiP5MmQfGPng83xpSv/UsGgY8PhsHXMB
	6BtxgvCYOSnxVzAFqZxeYu7ySEdX84jje1gepfec+78v93SnPiOBHLwk
X-Gm-Gg: Acq92OFycXdaB/AJ/vR3R705rD5si4T1AMPubqGDXZFAfkRwrsIKt24Iu6xuebIH/yk
	c5Mc2jd9kG8FyDDhzFwHIikrMLuQ6dRhkNS4bX8YlDNMOu1EDYzcA2B4TcTa2kIyJKBL1dgubOq
	0kc75eYYzOM5Wvm5keCE2xCQ85sPYvYcQa+6bGqVzI59iqbJeIjqmWVfBeVck8yx2kFyx9blD6W
	VliZ/Wg/ZYXrvp0CxKPDGOA2W0/wo5UCpbY2te3AZTNk/od1AqMI1tflw7vwHyqFeF+E0p+BqFN
	+R87pfBCZJjdQv2/JqvxOl6Ck/jvspMUCsf8CG7vlGQXA/h3XcL51ophu3LG4/TuE6QEEqDzj+c
	d9bnyPod5A0+csZ9ArMJBhOkL9VFYM4y7FU7y/GTM3Qsg4fyBmS6hHh+EDAePC2yym6a4wql++l
	IZSy16/EzCDtrt4R5pjwh8R1zxm2SV9vnfoGWZKzZkOXfZtIJtiNhmZiRXQrviSTiTj9VX1ZgAX
	dL11mAFZFVEsGKKKg==
X-Received: by 2002:a05:6820:6ac6:b0:694:914a:ebe1 with SMTP id 006d021491bc7-69d6ef1f6efmr792231eaf.47.1779358625454;
        Thu, 21 May 2026 03:17:05 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d771c3801sm252630eaf.7.2026.05.21.03.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 03:17:03 -0700
Message-Id: <DIO9ZMXP4AP8.2U06P4YWLPFV@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH] bpf, libbpf: reject non-exclusive metadata maps in the
 signed loader
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "KP Singh" <kpsingh@kernel.org>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc
References: <20260519215358.126364-1-kpsingh@kernel.org>
 <20260519231709.3D4561F000E9@smtp.kernel.org>
 <CACYkzJ6rxGSrixr9sChFyXyu3JcjG3JmZGR5YgA0vV0WNJPs0g@mail.gmail.com>
In-Reply-To: <CACYkzJ6rxGSrixr9sChFyXyu3JcjG3JmZGR5YgA0vV0WNJPs0g@mail.gmail.com>

On Tue May 19, 2026 at 8:00 PM PDT, KP Singh wrote:
> On Wed, May 20, 2026 at 1:17=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] The generated BPF loader program uses a hardcoded 8-byte read (=
BPF_DW) to access the `excl_prog_sha` pointer field, which causes the BPF v=
erifier to reject the loader on 32-bit architectures and silently bypasses =
the exclusivity check.
>
> I plan to move this to the kernel with a kfunc anyways. Any
> suggestions for the 32 bit fix (apart from an ugly union in bpf_map).

Use _bpf_md_ptr(). It's a normal pattern.

>> - [High] Branch target offset calculation is off-by-one, causing the jum=
p target to land past the beginning of the cleanup block.
>> --
>
> Yeah this is valid:
>
>  Compute the cleanup-label offset after emitting the MOV that sets the
>   error code in R7. Otherwise the JMP lands one insn past cleanup_label
>   and skips the first FD-close, matching the emit_check_err() pattern.
>
> diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
> index becfda5b9025..6950443ba698 100644
> --- a/tools/lib/bpf/gen_loader.c
> +++ b/tools/lib/bpf/gen_loader.c
> @@ -592,9 +592,9 @@ static void emit_signature_match(struct bpf_gen *gen)
>                 gen->hash_insn_offset[i] =3D gen->insn_cur - gen->insn_st=
art;
>                 emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_3, 0, 0, 0, 0, 0=
));
>
> -               off =3D  -(gen->insn_cur - gen->insn_start -
> gen->cleanup_label) / 8 - 1;
> +               emit(gen, BPF_MOV64_IMM(BPF_REG_7, -EINVAL));
> +               off =3D -(gen->insn_cur - gen->insn_start -
> gen->cleanup_label) / 8 - 1;
>                 if (is_simm16(off)) {
> -                       emit(gen, BPF_MOV64_IMM(BPF_REG_7, -EINVAL));

maybe fix the math instead of moving this emit ?
Also split the fix into pre-patch.

>                         emit(gen, BPF_JMP_REG(BPF_JNE, BPF_REG_2,
> BPF_REG_3, off));
>                 } else {
>                         gen->error =3D -ERANGE;

and while at it remove redundant 'emit(gen, BPF_JMP_IMM(BPF_JA, 0, 0, -1));=
'

pw-bot: cr

