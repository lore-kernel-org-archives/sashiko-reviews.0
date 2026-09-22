Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308151813B
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076312; cv=pass; b=WQhcfGrPitJvD1bRQacn1g2y1LKDfj8fOjPPi7Wgzo5rn7YY9g45CHXGLeyaNdvD1HSWBSm3c/X0nRJPr9WEOP/8FqVqeLVMFv6aV1ubIAHriwsIJ147rh8oEogWdDv2NCopVwILlBU5B3njx/veRgUNEElT/cziT46ozJlXmrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076312; c=relaxed/simple;
	bh=EmhzqAZw/qsy9hPwoqGI05KwTWaUgfqEurYCk0QECGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lR/n4DPdsk0c4Vg1gqHDIKLShw1SBqBvaiAHPwZVxnQPYQXUkuj5q5KouZFH3KubJ0y0j8TnhlwQK2MNANJy/KZfxWJsgnexjmOEqU9vhVOWQF/QJNRwb+X1yuaJwI9Fr9OahERY6DE8jz0egrhd/vOrss2EpiVBR9BJBgQLqGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeSsiBKl; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeSsiBKl"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso458606366b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 04:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790076299; cv=none;
        d=google.com; s=arc-20260327;
        b=p84Opjmi1RptywX1u500VahcQtsTaO+W7Y+/Q7RfQlMZrRG9Ce6U5/mdLHKYhlXZcv
         82Zl6SmmsBlQL0WGUfuZna8EFv5Bx5aOM7KwVNnzzZAabHuyYwXcBEqUscEn/nQS83yE
         az4GHajQCFVWi2u4SrscjiX+A2aUlp84lKev8ZW7yPiHo7hbxNur0wPZu1VyCkm1z83L
         rXQNHxxYXFY2lAfsyCrsviXQshKfT7sgKCXOm5n/B3jemCt1AZDIQJgyfkVMRG2eGysL
         ZK0z6stU45Ir1zxMFkQVqrNerbtfYQxQJ8ew1DINcnhEFYbwymlqIDY0AeATgOMrDwim
         VDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fzm1mrvF9kERqoNz+AruuNv230gzZVpxKexqbqU/OgM=;
        fh=HhTV4G5+xnJ3thQDc6cpcOYMN3AitX7qB0zPfKB89LY=;
        b=OO8L9GBXXk8UBXkKq5mP9b6Nn/PqwmhR+I1jkqwiDhav2RDgOyvqquLZ8DUxYSb49S
         /G7RnVTy+iM8eWDcVM1+7C9Vou10WFBXWHSYcSv8FjlDnJLegDEBNMZvIHDsrS5KJMxd
         bdbLVpC5Yr3p/pclClGHC1RiivlQ2UuPac1sKld5LMie7Be2HQCSLXpdyjy7WpLAgMNp
         9TXfNGdFEG8QYdZYO0u70nU9bXFP0fOXaJ5TEUUA5J5WVNUjLyu0Wa6fCnT0+wMRU1jS
         v6Bv1qldNbkWqJnJobIIufaBDHmeudrLsvMpJCDrLS9WyJHpB/A2TMrc/uHSPM6xAGvR
         QKJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790076299; x=1790681099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fzm1mrvF9kERqoNz+AruuNv230gzZVpxKexqbqU/OgM=;
        b=FeSsiBKlYvaDWTvVDpoGaYAPORQOFnrBXA9PUvEMX+YjvKY9W7vTWq1EIKO7wAj5wM
         YROm0T9R7dJ2vRqTnXoBH6oMwZhhYQB+U7TLyLEit77qIsXlgrMTuzqdTlzn90rI+Qob
         XsX9f7jAO1kktntBmbtxurjxTI1QfO3Nx2oezxlgwdUYxv216aUnwnIBQ2+O2NHBofBH
         0vwMrbIn29Dys4EN7Z7VTbMxzLD5M5xYqrKcNAW6R0K3BmdX9ixVugF8BQwl9JVci4kf
         MtcSBa3x6fNdIPXhkkAACdZmQHTdBP2WTNiyszr35UVZASHAljgnEkG0zDB+zOGfHmT6
         oIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076299; x=1790681099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzm1mrvF9kERqoNz+AruuNv230gzZVpxKexqbqU/OgM=;
        b=X1F/nueYJzhpdt4ZXtN6Sk1kmxPF1FvRrQzcj/5gC0cnNgJUpuSCdxjWOlN7QsOQBR
         K6h6kVg8dpfWvkKw9gvTUK/pcGwCi+rZdFkXlDqL9U54OLl2OIKivjhEh0fkfrc7wNBx
         kirevJzE1zMCLoDkv0t9E14AmHZLeLBdxXOyC7iRuISkfYYQ3mQYfycZXRD2wiDpAk8e
         mgcOQoUcRlP8Y+2+PhiqZHM/E+U3VVNwjJvQaYOVRVcv4ee8rVFl/gum5cVLLyMnWa7E
         InrhcWB1i6ZTDigM9FE6qP8ICdyxQe3+mME7VjUSwPnJ9jdfgoXvnEix19lCXG9Ub6nl
         3xZQ==
X-Gm-Message-State: AFuF++nV8Ivk2rlzYQqIifk1XEYLsEWTO9Bi5d6QrpjoDOmizNA8GeY9
	QMpDYW3gjHUGYUtUR7XlGqKJho+0yNp10rvUbDZh2zfVSU3ejJ/qhA6+phslEtBbyaya868ga3r
	MNhHAY3m6SPlDFZDPONmC+t3ZzyzjmTR83pqfQfwmNg==
X-Gm-Gg: AYBFou2G58QSA84lGNdSpbZdsJWc3DbSn2oKcOouoi00yXGM+4AR38QhqxXfhUiTyKd
	CgLd2CyhQhJ/r2U/GrKgGJWeCRkr7avItO1djbMo2dRiRrGTnYQsyKCTEyVbqHeI2P505OAJ646
	ZmihO7n2pT1l805MQFgcOa3gOSxiBVB/S1YpUSTZn5Cie8R9VpSrbu4d2qq8gl0Aypk2KXYqbAE
	BAqysV/0JLpW9rEr1CkB4p2mN9qgyqpqWHwXK62mgbzyLyBDgbD54+A7kFyfbvXAeovP0L78hOX
	8N0T49P4O76vdMnJImmUsLH56/nEB4DVD5I4zb9ux7rIEXX4ierH6m8=
X-Received: by 2002:a17:906:4fc9:b0:c29:4b79:e41a with SMTP id
 a640c23a62f3a-c2a157097c1mr1120236066b.20.1790076298901; Tue, 22 Sep 2026
 04:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922102959.41FFA1F000FF@smtp.kernel.org> <20260922105331.40498-1-ndaugoing@gmail.com>
 <20260922110326.AA0491F000FF@smtp.kernel.org>
In-Reply-To: <20260922110326.AA0491F000FF@smtp.kernel.org>
From: Yuchao Zhang <ndaugoing@gmail.com>
Date: Tue, 22 Sep 2026 19:24:46 +0800
X-Gm-Features: AcwNN1V-zFTo6izci1n096lh7CG88Kkqv-Mn4cwhqLSFmEQdDbqY8YXhQayNhi8
Message-ID: <CAC2BP3L1ATH2xS7Rp3RwqAjpd6ffSiavfNgxxQTruO1m2eMT5A@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: selftests: arm64: Add test for cross-vCPU LPI
 disable race
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

The test already gates on TEST_REQUIRE(kvm_supports_vgic_v3()), which
is the check used by every vgic test in arm64/ (e.g. vgic_lpi_stress.c,
vgic_irq.c, arch_timer.c).

On arm64, kvm_arch_has_default_irqchip() is request_vgic &&
kvm_supports_vgic_v3(), and the VM here is created with
vm_create_with_vcpus(), so request_vgic is set and the two checks
are equivalent. The arch-neutral helper is for the top-level
cross-arch tests; no change needed.

Thanks,
Yuchao

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=A5=E5=91=
=A8=E4=BA=8C 19:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests: kvm: missing mandatory kvm_arch_has_default_irqchip=
() check
> --
>
> commit 41b2f5071c9e0e643d02d3f1806d75461776914a
> Author: Yuchao Zhang <ndaugoing@gmail.com>
>
> KVM: selftests: arm64: Add test for cross-vCPU LPI disable race
>
> This patch adds a selftest to validate the behavior of remote LPI disabli=
ng
> while the target vCPU has in-flight or overflowing LPIs. It configures an
> ITS with multiple LPIs targeting vCPU 0, forcing its List Registers to
> overflow, while vCPU 1 repeatedly toggles GICR_CTLR.EnableLPIs on vCPU 0'=
s
> redistributor.
>
> > diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c b/too=
ls/testing/selftests/kvm/arm64/vgic_lpi_disable.c
> > new file mode 100644
> > index 0000000000000..d3480369d7607
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c
> [ ... ]
> > +int main(int argc, char **argv)
> > +{
> > +     int opt;
> > +
> > +     TEST_REQUIRE(kvm_supports_vgic_v3());
>
> [Severity: Medium]
> Should this code also include a check for kvm_arch_has_default_irqchip()?
>
> The KVM subsystem guidelines mandate that any selftest requiring an in-ke=
rnel
> IRQ chip must call TEST_REQUIRE(kvm_arch_has_default_irqchip()). This ens=
ures
> the test is correctly skipped on platforms without default IRQ chip suppo=
rt.
>
> > +
> > +     while ((opt =3D getopt(argc, argv, "i:e:h")) !=3D -1) {
> > +             switch (opt) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922105331.40=
498-1-ndaugoing@gmail.com?part=3D1
