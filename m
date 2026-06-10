Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7738747A0B2
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122593; cv=pass; b=QcKznLRo+3gvzxwgLOg71m8ABtSDZcVp5rEL1QsP/1oxFiytiyFPK4ZxLd9zxa7kuVluNBvig10DfaUpc72r5GP9flZPr3Ixi1V7GgeoKgbn+HaAig8F6a4GNEyx7zdeP+otci5S4Zr16Gm9mf5KMgQOUav3geKZxVAxoQqE7GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122593; c=relaxed/simple;
	bh=72mJCZ5KYYsVgkuAU6zlxPtbNTq33Q6bG2i5dEnXg4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7C+qed3zQzjIpSDO17ijEz3uANN0RSJ7oO1RdxzDzg+xYiRnIG1MiFK9MPJgwYFrez9OnX35MX2jBFPy2YWjm86UZK2iX2zMkJik0J+xFWrjqMnd5JXFQQcjvTwCGaYee0covI+nA3gusGHtcAAoNw9QW1SpjNcNGlpRWSAxqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C20ThkwL; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C20ThkwL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3966c0d5ac9so66550361fa.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781122590; cv=none;
        d=google.com; s=arc-20240605;
        b=Go8IAzdpMCLTiPFgvq7nXhZcqSXld6EIm3WPN1TaLt7IlWUTPX45WEtfcARy10J7HM
         qXkob51hFKiMd1t28Qq4Mpto+MDuYOfaVZM0WNPmRn12sk/oIWfnGym60wIOY9qNN3Jq
         HvF0KwK5jspdtb9z+PISry3AS7pg+kllhRQ4SG2vIuGnNOUxBbIHFYaLpkRGYASq8deh
         2zIGwecI3GVDptqZhwALL4+Sa8B17rownowZm1k3/D70CwgKp3kCD9/2Uj0UXOc6yB+d
         U1d35Sh98j+KTY2LqSKu0npt2LfYQgPQv/Tbo+xryl72DfttN9Rpf9iKaDzMjBLFs5r2
         bO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDuIdBL6V7SP+lBacx19DNCO4e4v3ySUd9kgTjKOFe4=;
        fh=wqYu1lGltArXwteD7WYVag+cmyKKmwUIlTY51VAadtQ=;
        b=FQxXkzu8sy8nJjACFLTZ2uz5BNv6dGYTJyvzQg+y+8TTafnLLPknhwC8+LApTyr6DL
         PIWtIjfKVMoio9pwx4TjjhKbuv2xYjVQzgwzKr+J996izKbm1q1An+MBPjFxBPsjFgA5
         lydjc1mJFJL1+HEWrUTlFrq2Oo9rdkt7mVKNxZVp527qZDRue/j++NQD8nbac8SpMUPo
         6Od4qrPHO5tLKeozc4SUzJqKCFG34tTqduZ/GbcnGCoVeTd84sMT6LyhJfMtXdy0Ey4B
         z5G5viqvU0MwFtaKnsdIoCwnWU3J4jpUWaFlv8Y/L6tYVYAZiH2fAyNH6EJFnSjufSYP
         itKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781122590; x=1781727390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDuIdBL6V7SP+lBacx19DNCO4e4v3ySUd9kgTjKOFe4=;
        b=C20ThkwLiMTxSz91aCHT0f4jIG1XIfHXUCScGZNjpCkv+2wAQp+ShmkQM0bjunhWIu
         QueILUp8T8dkOvzfka1kBK/2WGUJA5Z1Hf3kKsnolj2L/hlGujgYkrszuxgtp8CknNVF
         hqwPZm/W5iSqpdFUWhKou00Gjd27c4j0BItMg84HKhJAlDygvlsrN9m7tfEe+bXOa3H3
         DN+xOVHn+5Fkq9/pk5wSpKu/zqxavtOMgYsdYRTelheHnKe19Srgs7H3KUf5/udkNMhQ
         Lx6ecibBM7GBQLLqOOQfAZR57ACVO04lvT51AhfmUbDp9qwLMIKClNINi76fL6GpGPDc
         NeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781122590; x=1781727390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDuIdBL6V7SP+lBacx19DNCO4e4v3ySUd9kgTjKOFe4=;
        b=WmXwg/VCN8XffhXWQVEuzxJFAHbqIrzCzAW6RWTEsP0T1dpkyyUeHREFLhfdRdc7Aq
         yxcrHqA3Fejt0wUYLqNdJ44KUiemtnH7DCipIRJ32fM7UwQyV8t+FBQhHjPtFbrnPFIC
         GWGYBF+qpUydbKjbCyfj0ZAcSrO9cBkH2e+M5W8czesmjVqZp61eZ4TmCJgUrkrSB3QM
         9eeWrI1QhPjfyBz9wnjCCIKBkUvyXVSR/kRb4ZIzIia8ftChFvq78N0vxAThiuyiMfER
         7ESRJiIcHURAI4ATNjRtRQq8/5Jl+HJqHMQSKI5+Q3OkFFd5nDUCe53KStryKJ2LPIc9
         Q47Q==
X-Gm-Message-State: AOJu0Yyfe4tDDt9DQq6NVTlwv9Coo++U62IXh9eNmOmrEwBByiYa4noa
	x8+LAidrd23s5l+hsdcJSCLqxrL96BkMr4kor2StOBBfuy0GCESXkfCNUZtuA/XyFg4mG9p6Ymz
	xHOx1DzHO6fZz8lYlwNdzMjSNdzaqMxULyhdVrztl
X-Gm-Gg: Acq92OE7QWpKt/Q2Zn5+Q7VhYU7CelJJNktmUqbXS2xPJgBr0j06C0BIXcplSkTwOgf
	wnz9J4jHlfWGt5gmQ1w5ZL+dHq3YDbgcDIDArfAxR3T/2pO6qi9UkYc/5Nv3J1HNJXgh9oO4WKf
	pCufY2pbvZMwC4VAGCatkYFJKKV29YE1uJTc6K5epz0ukXiwGnaAC+CwlDUJ+JcnustusjWUdSb
	WxarxDAjPtYyGcaJ/U7w1n8TwnpFQyuUPj+kbFB0ayT7MQxr11y7qTG3Nga47krpDFylYOrmR9i
	lDUIM+ybjIirvogPbA==
X-Received: by 2002:a2e:be28:0:b0:394:8fc:8c44 with SMTP id
 38308e7fff4ca-396d05b79d6mr69423151fa.0.1781122589145; Wed, 10 Jun 2026
 13:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610005338.2967132-2-seanjc@google.com> <20260610010314.DB8861F00893@smtp.kernel.org>
 <aim4lld49oqLrthg@google.com> <ainFwSTb5-8itT9y@google.com>
In-Reply-To: <ainFwSTb5-8itT9y@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 10 Jun 2026 13:15:38 -0700
X-Gm-Features: AVVi8Ceu1fH4ea1Sf9BGjtK5ZsWJ_KP_7z1Uoi3G2FEJ6paSuzfa9CjW3fkYlgk
Message-ID: <CALzav=fUfhGP-DMsDR=4ZX2Cap=-L=c-1kwxTaUxSdknC_ir5Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] KVM: selftests: Build and link
 selftests/vfio/lib into KVM selftests
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 1:15=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-06-10 12:18 PM, Sean Christopherson wrote:
> > On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > > > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testi=
ng/selftests/kvm/Makefile.kvm
> > > > index e0ddd3ff9472d..14316358fd9fb 100644
> > > > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > > > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > > > @@ -257,6 +257,7 @@ OVERRIDE_TARGETS =3D 1
> > > >  # which causes the environment variable to override the makefile).
> > > >  include ../lib.mk
> > > >  include ../cgroup/lib/libcgroup.mk
> > > > +include ../vfio/lib/libvfio.mk
> > >
> > > [Severity: Low]
> > > Does including libvfio.mk here break the "make clean all" sequence fo=
r KVM
> > > selftests?
> >
> > David and/or Josh, can you verify whether Sashiko is hallucinating or h=
as a
> > legitimate concern?
>
> That is a legitimate bug in libvfio.mk. Want me to send a separate patch
> to fix (see below) or do you want to include as part of your series?
>
> diff --git a/tools/testing/selftests/vfio/lib/libvfio.mk b/tools/testing/=
selftests/vfio/lib/libvfio.mk
> index 9f47bceed16f..1f1ab180f42d 100644
> --- a/tools/testing/selftests/vfio/lib/libvfio.mk
> +++ b/tools/testing/selftests/vfio/lib/libvfio.mk
> @@ -21,9 +21,12 @@ LIBVFIO_O :=3D $(patsubst %.c, $(LIBVFIO_OUTPUT)/%.o, =
$(LIBVFIO_C))
>  LIBVFIO_O_DIRS :=3D $(shell dirname $(LIBVFIO_O) | uniq)
>  $(shell mkdir -p $(LIBVFIO_O_DIRS))

(Forgot to delete this line but you get the idea.)

>
> +$(LIBVFIO_O_DIRS):
> +       mkdir -p $@
> +
>  CFLAGS +=3D -I$(LIBVFIO_SRCDIR)/include
>
> -$(LIBVFIO_O): $(LIBVFIO_OUTPUT)/%.o : $(LIBVFIO_SRCDIR)/%.c
> +$(LIBVFIO_O): $(LIBVFIO_OUTPUT)/%.o : $(LIBVFIO_SRCDIR)/%.c $(LIBVFIO_O_=
DIRS)
>         $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
>
>  EXTRA_CLEAN +=3D $(LIBVFIO_OUTPUT)
>
