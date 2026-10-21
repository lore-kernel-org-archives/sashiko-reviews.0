Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565399;
	b=4xaP6aatJUL/JZl/7TbZ77jDgkyTDCHjDI0cSJnUPu7hxjVqQg1+QvTIW4rb/LnwwJVj
	 xCNJ4wxk6BqyRFB9JZJpmKtD3GIis2MQFOZx3tMYrVEhlHELg18CvvemqfNlz/Y3f8z8i
	 GjDVh3AbGx8+YnoWzYGDCXEbN8oGgBZlZOZ41+CsAeMOvtaqVHQfbgARnX+vqIZRuhkrI
	 0raA9sD65wdJcokroB0w2xP+wOzNZcdtbG4htPtPPPdIm4R9UkcT/jfLdqSL2cXDOH45J
	 jhglsqGpe/O5MIzPdSqX7CmdLnsd6QHIt6f+6hI4jmHdkhBY58RR1YjiDfP1g9MpqwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
	b=eln0euzoN6d5g34qcmdWIV7oMQJ7CpP70v/Uqsqa4AaVE9roMx5T9UhTaTn4ucgR017i
	 GSb4E23MxNnfGHU8CwGMMAlyZNp5ki9kmgB178Z10/ggjjqzPAD5JgC5Kf4lLpMoh8Tg4
	 iYYw9gUXldxmfLx7W5P6vQvYpJhQifkkpXItlykXZhlEGm3JSyx351nvTq9p01sYHmSu4
	 HyZRZJcTprG17zPYPGckRS1VAfGP/uRrjHUYmmPhA+MWoqYpbZTKupomYYxGdP+F7NT0I
	 NcYqjE4l6TotqvHTbw44w+BMW+5z9cqItq5k5tY6gdtFoqGgIOT8go6U79x64SISyvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pxiobd6r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8590606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8590606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pxiobd6r
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f3c8958d5so47627385a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565397; cv=none;
        d=google.com; s=arc-20260327;
        b=svU94LEyDtwTH7HwhMKVb2a9j4FKqUb3LpxR/eTPfLGpk73iC8OP0+lKNBa4Lm5nme
         Txt6C7BT6PJe5ohHO9tLrmTs5bJpU/goHlW0jukVb8i6vPXmqcFzAMz+5eX0+Cg64ptr
         j+iK0qxp7U1DJHJjExdFcoI7bio5uMud0ylYq5pRwC0izt7RlRuOuaSqyKd/wWNPsWRi
         nN5cnb0kUXFON+RthEKL65ms1MPgdaVWigfBmDn5HyPonYF0BOy+fANVV2xg/yBmJ9JR
         q6eG1U30Jutv+HlCAIuumQtfCFqdjwqLBQJILD/3EbeUqvMzbk8vnAj1s9sI12u5EG2M
         sERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=k3kr0h8Zv3JiUrOieKTNXPaK2/qC6G2+WeTDQua+fEc0KtxAaQ0vO3ill2EHF06qV1
         d9AagfXuwyS8a/0coUxIbpp4GwpaTk+l1Hje8+Qb2gnao4J2BVq73qqdhJMbQoW0dqby
         X4mQJGemXJgVRTa7J8mNNQzqR7cVmNDAd6rDWplRyTgHwJUVre7YAGzU5MgrKkd1tkG9
         WbvTIrAujwv8c3KvIza0AdvmJUOah4OorSwUaTwYepoMKdOU6b6x58sKcu/Skki8MpRV
         aT79ibAwGreVhTJLISeqw8Xg0Py4qOZaM+sHkBMop+orxQcOw21E97DbD/RnRBTSPUrL
         Vjxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565397; x=1793170197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
        b=Pxiobd6re6rUtoRdXVHL2VWUAnsV+G9SMHfqBhnMoX68MMytoVEhqtjZcQWM7zaMlY
         kAlUvLk7D1xDBO4MjfBo7cbDn9qjp64Hnv1CSEyfvWGsw1mzkUHDA+u1DMKi+57m5SnA
         J2UEmGD6e6ujLqaFuBZWBjsK+KNd82DQ3FwdZbm+tv7CbSGeZVCQEbc4G1V0Az8eNTm7
         emA9XmbXaysxZ6wx3KyNGFV9rOj52Qo0iUpKa8NopYvWqx7J4tZq1KUeF++mAH/TSHeh
         2UpCNm8IF5+JZS9I3DVLHxiyUKXFRxGH5rL0XXQ/Pj46thoA0AExRK0tQ1B+EPRyzT2r
         a06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565397; x=1793170197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
        b=bkahjuxy/y80ReW/o6cmbRDdNX6JRP7OywD5EJA8286JSEplEG7oi3ZYkIfLzdzlqo
         06v/AeWBAFYVanAqCBf4znIW8Pm389Exj2uSUEdExPEOVcwsm2GKcgXZnufU8Td10uwS
         WZG2ppZ+dBnEz0IVkyyoE5G0WMahqpCWQ4fI38gexEk99kRIX1RCHVMzWrPQ3fz+Z4LD
         0QvfT9X4dxKlNaQiTVSrlG2E1Dtn7yyFTV4/dHKENll9tFmtM08/bTrd+CVcRY+/350c
         3YJWkAV6B9hulIrqn9nIigcPCuvrJBMSuBWsOZKxiH2oby4EmS7jeX11vazzdEg7mZHN
         ERxg==
X-Gm-Message-State: AFq9FYJuqneW8MNCe53fh6zAo0TEqltyjQU11XRO9fFXLix+aDJGFWKO
	GJzHt+nM7IjTSU5qs25f+UpubjR1zWbkcCm38qEghefxvi5IW/OPd+y4bp2+CAOdxIdQdCM/lwT
	dN3sRveBdnqTDi8m+Jt/flfC2NrH01jApeUyl
X-Gm-Gg: AYBFou11dc58oFlPGsf8uB4aCTnRSffdJ7kOwZOLi5bAD/OmxtfHeHNhmIA9xOiaE/9
	AN73Cj5olowfJ38bu9HoVTEAf6dDBf4JV9tj4+j/WISN+66K1J2CJU/oRZOpOvn4b2ZqQPqSuUQ
	lYJJ92/J3WPUG+SVtr3wyevznY44/PxPlB4hQmgPNhfaGi2DUrycad+WgBrWmkLrqSCPjARQPve
	MkmueyBCADhxJ1vYWfw1hscT64HLhc4lckxPHUccVNckUWZa9Lf1b56d87Gpf8RWb5GZ6T41he/
	Q4wbpENTDC4ksWgR/u7TLrmA0mfUYkZTS3HGEjI8hzYpK9fkuXOgUwZ+NFHuD9XIYgvk4qhM1iu
	uP5/dbLKq70mLFhjUW3HS8V+8Rj8AZXioLnFJzA==
X-Received: by 2002:a05:620a:17a3:b0:93e:5e2c:8bf2 with SMTP id
 af79cd13be357-93f57f1efbemr275798885a.21.1792565397525; Tue, 20 Oct 2026
 23:49:57 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-10-a0282524688@gmail.com> <sashiko-outbox-169142@kernel.org>
In-Reply-To: <sashiko-outbox-169142@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:49:46 +0800
X-Gm-Features: AclHuK-nXMNcCny-Rh0EBmuIB8LxFqooM3YOtF1zoHaqSsrx1181Jjhs-i_POrQ
Message-ID: <CAOoeyxVZ-shU+XgaaHR07dARtVokwstuVNcctSSPW-KaT8pwUA@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] mfd: nct6694: Extract core device management
 into a separate module
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mfd: sleeping lock inside atomic irq_chip callback on PREEMPT_RT
> --
>
> [ ... ]
> > +static void nct6694_irq_enable(struct irq_data *data)
> > +{
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> > +
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: High]
> Does taking this lock in an irq_chip callback violate lock nesting rules =
on
> PREEMPT_RT?
>
> Since this callback is invoked by the IRQ core (such as enable_irq()) wit=
h the
> irq_desc->lock raw_spinlock held, it executes in atomic context. On PREEM=
PT_RT,
> spinlock_t is converted to a sleeping rt_mutex, so taking a sleeping lock=
 inside
> an atomic context causes a "scheduling while atomic" BUG and lockdep spla=
t.
>
> Should ddata->irq_lock (declared in include/linux/mfd/nct6694.h) be conve=
rted
> to a raw_spinlock_t to be safe inside atomic IRQ callbacks?
>
> > +
> > +     ddata->irq_enable |=3D BIT(hwirq);
> > +}
> > +
> > +static void nct6694_irq_disable(struct irq_data *data)
> > +{
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> > +
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: High]
> Does taking this lock in an irq_chip callback violate lock nesting rules =
on
> PREEMPT_RT?
>
> Since this callback is invoked by the IRQ core with the irq_desc->lock
> raw_spinlock held, it executes in atomic context. On PREEMPT_RT, spinlock=
_t is
> converted to a sleeping rt_mutex, so taking a sleeping lock inside an ato=
mic
> context causes a "scheduling while atomic" BUG.
>
> Could this be resolved by converting ddata->irq_lock to a raw_spinlock_t?
>

This is the same issue as reported on 6/12; this patch only moves the
code into nct6694-core.c. The separate fix in v10 removes the
callbacks and the lock, so the irq_chip moved here will no longer take
irq_lock.
