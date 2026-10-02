Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAE368D76
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984644; cv=pass; b=oL6wvvkFAW/GTxKyFp6e9gAzrpK/HIq0Ct+d1FhEgh9qVHAqRfKQ0p2QQvq2HeiHdEgFX4xncMAc3wwfc0kWdqpbzngHwzIac0F28uQedVuCLfngyfdQWmiAWLc3vKSbcCUs88uPXpHN6ZoSon+I3P2W0MwepsTsiGE6/0dZv/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984644; c=relaxed/simple;
	bh=DZr/vCbFgIBJPmKcQOyr74fLm5UgcCgTHWfWGuIHrcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDzi8DOs6NONjRLPw7oU+a13ji8o1WduuUdUFrR5YGpPfBvzlTru/7s4JUaeoQLf2xob2P3EK3/kob/9EIVy3griZTBvdDc2yk5x3ZfLf1yRhEd40k0VQVOzxhe7CQVoO0EhtXRBSu1hji1G6Ople+W9qQl46zr/qGAcZ5xaD/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vM0jUFq3; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vM0jUFq3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso3838a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 16:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790984641; cv=none;
        d=google.com; s=arc-20260327;
        b=TVjTfqtleySzdaZjadPRzgNLhQ2OGmtUbHZLxxEbJjcli++/cuvdwspEe9M45mL2tF
         fl0cOYb6ZiFB4AWg6dg9287kcvcdTGttYOePJj9ywS+Zne+Zg7zLdBa6GWDr0D5Om5TM
         RdS64F/lIL6/OkfPt4wVknQP8uBX9rhpS0ZBd65SNuicUhKL52ifX1Eg265dIcf4u67Z
         vDFIr+HRZhlkuZndJ6nQnTN5APESH7OjtHh7m9548jQm+igLulfEfKzx+dWMWTGHu5xI
         B9U2WFaNzvvJrkEcgVd3HLOR8dOda4hk/GUcR8PtGjs6YSr7SeIFp2/Watg6iAL5w4Pg
         BJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aIlGyARb9eRqNb63DpSQXFW7TwIGyoCVVTaa9X6iF28=;
        fh=9lL0hF0NMGethsOlsxoDeLBT8jtu7UHbhiekQ8TuZEc=;
        b=WIMQAAGvQx51BzTXl5aMQliNdyRkCkcIjh/lbkSG1SSm1AypKNwY2dFbID1Ph/zs/8
         ub/JmoZTqJ2dY5RZ9U8AsOy+T/KSlmO9ovqPNVEGIvWX41V86m/rVLOd69QBsF6VsvYk
         YNgv9ZpLFUmDA/W2oNOK5fRsLxWxw7P7vYz3jNxBk7JQ1lObW/m/8lSMe6fkimg8l3R6
         0NIQh5O3KO4wwfMeJzxk6/t5XKwyXleJ2uDcxljIrJ/vJTbPDMyWT+QPEAu/CGAr6ito
         UA+uDSHi/BuZWwGXFlrwWWrr7WytT4l0q9CP1omko9sBD35pmvn/rGa/Xfde+eg9KXo+
         JSSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790984641; x=1791589441; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIlGyARb9eRqNb63DpSQXFW7TwIGyoCVVTaa9X6iF28=;
        b=vM0jUFq3V3h4T44xfj9SamhIaaqNgmzZr71aRJvQQTmQKTE/63giH2KDBSyhJr5PH1
         USJVe8KLD+FaPbcUpj9kp7scCxOF1VCiNhZFePabhBhrrJnIx4QREO6Q8abZFZ6bQd3x
         62j93vlISYENb1i7ia4MerTnA53+yNA1uIwbZmbVc+56TsdypgHTm+s0FV4JULLCQXuI
         owdWDrDyWKs75vftP/hwEmi0Inq7YTIea+65obkUSQ2G2INrlL4DBXM0nOG57U4SKJX8
         OQD/tsNNzcX1/MXT+c9S6dG9IGnp10HqBVQBKjUJcaRyWeJzFPkYKi0896OTKy//RDk0
         0aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790984641; x=1791589441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIlGyARb9eRqNb63DpSQXFW7TwIGyoCVVTaa9X6iF28=;
        b=uv+HdfStOX6eE+T89kMCPmBZGhd0jam7IKr5MVda6zlDetKP9YPO/y3CqjfLL8jUsv
         k2Qh+L/apzrc9u2XLImUpzmpHCUuXUWLKCRS4Ma3bneeOjzyu5LLzV5kd6aaOnnuY7wP
         /4u8MExVe4uQ7TOwLewzYc1gK28NiIBerxj0bqF8shohGhAK/u0gkwDMxkuhF42Wjvc+
         JWgXnmRaKjDeU/DWoqE5286HdDbpSPZaT6PajCQKg7U36cHUZfDoRwJgQS7iUx6U2dgn
         EMX6j9Ch2TLqZ3I85dehWe8SFtrtZZsGsnugfe+90kO+B7GLe3mNA8MXGU6d5DteKv7Z
         S/aQ==
X-Gm-Message-State: AFq9FYK0Wibn8frDfj7BjRJhySNQ+ZBN+NIuXaPtsGaeLJYFR04byEAC
	BrTRqYmICxT3sGIwtS0/rB8unIatg6fdZ25/4c3gDGIYEYcmqQL06uBV3YM9seMV5xR0uPP3Kgd
	lx6iLnAt/zr59qVVMMkwLFcLXeocp5Ftn61vYJAIVO8n+c/SCfXtTsuF1
X-Gm-Gg: AYBFou05AJulvL3YZiR7ltW9rB8ZmtEzyG1mcclm5wASn6B28apP7TJbMAxOV+OPyb1
	tfyXnmiDec+uoQlBzi7P/7ZT8YmGCInKPDxRYXdc0HtXYqUd362C9hpEYrMPLFYn5I87OPZ65JD
	HN9PUDH2WgAEsftNYhSHmJJvmrhX1lQXIEgLEfyx7t3tcQXvBRg7gMISFAPA8KSNCPzUmsYcCHL
	cbhbIg9ZNau9A6lf3PhYCWwfleEFten0CmImgAxwkpTqJYYd05khjfQI4CO2AMdPRcwDHnUB7mc
	XwZrXO4x9PE0oHCyVzKZ46KR2wjDSx3JZhR87v6INYZIvmcGiz+bJmo=
X-Received: by 2002:a05:6402:a2cb:10b0:6af:7a5a:97e4 with SMTP id
 4fb4d7f45d1cf-6afaf6bf03amr12928a12.12.1790984640920; Fri, 02 Oct 2026
 16:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com> <20260930173635.3362655-14-seanjc@google.com>
 <20260930175237.A8FD21F00898@smtp.kernel.org> <ar1QBSKMGJUFBExK@google.com>
In-Reply-To: <ar1QBSKMGJUFBExK@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 2 Oct 2026 16:43:48 -0700
X-Gm-Features: AclHuK_u3oOlu9nwYVbzwucGA7__Is1oGfxZD76ma2kyYIXaC_NIXJdsyLaNogQ
Message-ID: <CALMp9eRkgiFYeQcTU_aweJQTfrq7ijN5hw+6otKE_RvgGQm=Uw@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] KVM: selftests: Use KVM's reported TSC KHz as
 L0's frequency (sanity checked)
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 11:23=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:

> > > @@ -212,18 +209,30 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u=
64 l1_scale_factor, u64 l2_scale_
> > >  int main(int argc, char *argv[])
> > >  {
> > >     u64 l0_tsc_freq, tsc_start, tsc_end, l1_scale, l2_scale;
> > > +   struct kvm_vm *vm;
> > >
> > >     TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX) ||
> > >                  kvm_cpu_has(X86_FEATURE_SVM));
> > >     TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
> > >     TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
> > >
> > > +   /*
> > > +    * Create a dummy VM to get KVM's default TSC frequency.  All CPU=
s that
> > > +    * support TSC scaling should have a constant TSC, i.e. there's n=
o need
> > > +    * to calibrate the "real" TSC.  But do sanity check that the obs=
erved
> > > +    * TSC is within range of KVM's reported TSC frequency.
> > > +    */
> > > +   vm =3D vm_create_barebones();
> > > +   l0_tsc_freq =3D (u64)__vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL) * 1000=
;
> > > +   TEST_ASSERT(l0_tsc_freq, "vcpu ioctl KVM_GET_TSC_KHZ failed");
> >
> > [Severity: Low]
> > Does this properly catch an ioctl failure? If __vm_ioctl() fails and re=
turns
> > -1, casting it to a u64 and multiplying by 1000 results in a very large
> > non-zero value (0xfffffffffffffc18).
> >
> > Since TEST_ASSERT only checks if l0_tsc_freq is non-zero, won't this pa=
ss
> > using garbage data instead of failing the test?
>
> Eh, yes and no.  KVM_GET_TSC_KHZ existed long before TSC scaling, and whi=
le KVM
> doesn't sanity check tsc_khz, i.e. KVM_GET_TSC_KHZ could return a "legiti=
mate"
> negative frequency (when those ~2.17PHz CPUs come along), in practice che=
cking
> for a non-zero value is sufficient because any bogus value will quickly f=
ail the
> functional checks.
>
> Heh, actually, kvm_arch_vm_post_create() *already* validates KVM_GET_TSC_=
KHZ:
>
>         r =3D __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
>         TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC f=
requency.");
>         guest_tsc_khz =3D r;
>
> so this is a non-issue.  I agree it's not the prettiest, I just don't car=
e enough
> to clean it up.

In my best Sashiko passive-aggressive tone:

Is it possible that vm_create_barebones() bypasses that check?
