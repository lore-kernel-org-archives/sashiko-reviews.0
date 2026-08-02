Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13537D121
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785705289; cv=none; b=BcRyZsy15FftXBYnTzGuBAQrVsv/vObQYjnjnlxwMxrEr9VLEZsVcgKID2fIb1ogmZ5GjpBEVcB8x19EJIBzlbtsGbbYJVzukqlFFwvtbwVYs/0wsgViH+65vyJ+oId5NBQgDHHvlkhztiqA6l+qxgp5u87EpxW9lAkyGr3k48k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785705289; c=relaxed/simple;
	bh=xiH5K20zhFLujCG5cqdKwN3NVZ6Xi+Iv8KH317YeteE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F9ga+I5+YreFfRfvLXcgDj3yLEN5CumYat06LUrBQI2fawF1FMu3O/DNWxkASVLI7Y17DFyZTUBa5DmgsNmcq1kFNz+U5mBt2CFvAOfwNWru383Bvrfm9JA1jFmpd0dMxg7ULInPCtee69Q7ctfXm3GT38H6L5QOF1nyp+zBMFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7v75ZMR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7v75ZMR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2554845b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785705278; x=1786310078; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I4KXpZ+gjMlK0sJuzsGSRQEWx7WfloFw34dvf/AKuII=;
        b=F7v75ZMR4XoZiQXk+VBeuRkSe5KbUKVX9SpRYw1nL7bpdd5OQGlMR8fsPqWInf+m1H
         q4+HQ3ktYo1x+5k5cUOB7TuP+Kw/Qvri6qFnI18rvnSvEgAa1PXrHZ3XTAIMWLlUUWhv
         oTGP7LGdwUQghcDUkSaAVCi48hyO8pVX8Gewu+eQ44ckrsA1Lo/ipJ4bqJ1izQiKYW2n
         t+UcxGByY1azq6vgS8YvMFzIRDN4499qeW6Ejtk/+wORBaNShsZrcVwPeBW7jySauiX6
         Ds84c/mP65co9OZxBfO0rebNBonLrohuDsIKK54Y9koXyISEQlyxgMmobyG1qn3VlX1b
         wyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785705278; x=1786310078;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4KXpZ+gjMlK0sJuzsGSRQEWx7WfloFw34dvf/AKuII=;
        b=Jg0j52LU48sO3mLMgoV+o8K5xR+Wtz/cg8JFuV5SRRnUy3Nu1bFLfLumqBWbXfhHEY
         V1JHj/eOhhue1TXX0bVbdbJ0qs+kFFDlrvvVlC3V9wPnI5xpJuHxBresNd446GCptwNa
         S+4jp3wR9ozV8PcvJZKWUjLgCD3Pf5+YpBX3UFALz5i7ah8UGqvGPKoKSbQBuNQp7e+z
         O7q7AiAkaijZkX5CcX66GzRiLlyMdkD2JcJT5JickZKhU5rxYs+BI/egScqMQGBQI0yy
         i28/WDqqmV5fHAGMayzc0PZp+Q6Q6A2YJgqhnljAJtvI5PAN10w+zfKgQvVYMKflKCcd
         ZeyA==
X-Gm-Message-State: AOJu0Yz61qcNd+aFlqZdLb3a+isbRfOSjlpOPHGPoEY4G/pBtJYsusHp
	MGzJEqGMBOV5dGpcU7z/hUAAiEP3WvHqQamI5/coW0qUo2F27M+NR/GkSRkLLA==
X-Gm-Gg: AR+sD13its/19tKNL41wyScSgnVnz1H5dZcuUCQymcLiXsZFhiDYgt0jYfwzFGlfC27
	/rroQOzxEB+TDcpG9O127VU/ng2gnoXZec8HPA2L9KS+BTBbMdXWwKE8o/JLmFmbEMR7dXHeAtM
	cyRFAp0on4Z0HRndEOZRV925uCXo6L97yPjgGotZo3Pa6zgemVSiQaXb7S5OK7n32TiBcOLT0xp
	9NfqDVKrpz4AwkAViTJBQAd8p5/zDpGacyXkjg/nPAVI2CbC+HRtUfJhdb+dW65l7Wz8Ii9TG6T
	t667AjhxzTd61m2/WYzQNSAYuz3nWmBOh0SABhVixwrSI2BCHbYjSKJLsGQxnoNAl1uBSDshNml
	63IwizR1VNNlZPOzIKjgxvdtBfIZCeLjG6IOTL5cU/hwa7CdiBsS3SxQ+ppK8uS3Qd37ODNzGiE
	6q3uk5WXitRFvUReyW8fzim6lgSpPYcrg1UcwIpMLsf4XVuS1MDTsHp/QVJTODKuB4QR23JjarY
	pyzM0q7LV5AQ7fY
X-Received: by 2002:a05:6a00:b4c:b0:847:99bb:b6d8 with SMTP id d2e1a72fcca58-84ee4840802mr6580892b3a.26.1785705278245;
        Sun, 02 Aug 2026 14:14:38 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29f31dsm2747170b3a.36.2026.08.02.14.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:14:37 -0700 (PDT)
Message-ID: <ddc2fbf63c32eb8b933589d27550f2a8d0eecba0.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 3/5] bpf: infer zext_dst based on static
 register liveness analysis
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Sun, 02 Aug 2026 14:14:35 -0700
In-Reply-To: <20260802210741.D10C21F000E9@smtp.kernel.org>
References: <20260802-static-zext-v3-0-3456b2604574@gmail.com>
	 <20260802-static-zext-v3-3-3456b2604574@gmail.com>
	 <20260802210741.D10C21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-08-02 at 21:07 +0000, sashiko-bot@kernel.org wrote:

...

> > @@ -15026,18 +14941,14 @@ static int check_alu_op(struct bpf_verifier_e=
nv *env, struct bpf_insn *insn)
> > =C2=A0				if (insn->imm) {
> > =C2=A0					/* off =3D=3D BPF_ADDR_SPACE_CAST */
> > =C2=A0					mark_reg_unknown(env, regs, insn->dst_reg);
> > -					if (insn->imm =3D=3D 1) { /* cast from as(1) to as(0) */
> > +					if (insn->imm =3D=3D 1) /* cast from as(1) to as(0) */
> > =C2=A0						dst_reg->type =3D PTR_TO_ARENA;
> > -						/* PTR_TO_ARENA is 32-bit */
> > -						dst_reg->subreg_def =3D env->insn_idx + 1;
> > -					}
>=20
> [Severity: Critical]
> Does this missing zero-extension for BPF_ADDR_SPACE_CAST allow out-of-bou=
nds
> arena access on architectures needing explicit zero-extension?

Nope, in combination with changes to bpf_is_reg64() in the next patch
it does not. bpf_is_reg64() handles BPF_ADDR_SPACE_CAST after that change.
The commit log is not very clear about that, though.

...
