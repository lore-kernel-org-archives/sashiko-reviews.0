Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C606318ED7
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699715; cv=none; b=rBJECK8/z2swy0ANM1oSfYsmQ5V3GRjR60xJ4ZN3A49MGjfW4BAUWAVmH62tBBD2uBB5LbLB92iIjaRZ8hfNPmAdHcIVk4o+CUkq+fUDmVhD5nAE+omymxZmsZuHbcSMqBX7kcFqplBvwZi/Q+qtwB0nDz7Ehc2PyVpUjOaCxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699715; c=relaxed/simple;
	bh=jgX3nz6297iE1fo8scx82ustqQCGXIsPg7fXogxw2RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idLhjW5m0TGxTVPHNtlx5U4QZ8IDFyfKDn4JzSTx49B/4sKSD34byo3szPeWRk3HET3EKDyInjrAewl4pz/G+Z8YgozzTEpeg4o/rSVVNy2LE2ofSIYLQ2eZTkc5UvXkBJmynsTkBpHwnIWHPMErb0Lh5fdjA/aFJwK/jsOOxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7ZkbZJV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7ZkbZJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193421F00A3C
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699714;
	bh=v4YDleoQ9HI/5bEWY8b8uNLSab5g+10331TZlWXVhxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a7ZkbZJVgC0eG0oO58ErQT+mYXfl8DUplHYDMwQeMmSqnasXVsilg70AEMuFT9Q65
	 s6jN/FiqqpWm8Z194of4i8/h/8DKDxBFucWAYReOhdNtmLQ+8CkwTuZOtn6QLnF57d
	 oUPqzFd3Br96nPchz+0aHuo0BIVUTBIw5w4ygy1DB5ZEyOMI9pIm9gKUsTE0GlAzBB
	 nnTyTkzkCLK1HGNKuCUeZJwOfZjf/TJ1HPJZgREX+jPTds8mA5SmwRw94fPskYLtDp
	 Q+rYLFXEOISOf2mLH3BqUJxxhxsvbVmLwZditn3CoSDNwfVxzNCPWPOm2mQ/uF2+Uk
	 XMzcK0CEnReSQ==
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-479eb8bcacbso6112726b6e.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 02:01:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy+OtNfl7sKKmqcnB4r8plWkpTgy89sXdjWcK0V9ZFZ2KH3twGI
	88k8fuNriWBoFlXiUtdMYJRPmPQJv3YWuAombCZFqUCNaB2hB3NiBkGZ1hLL7waesbFkEhXtcdb
	dsrZwHN3UTlQAAoVqbNavvUu2r9s1VNg=
X-Received: by 2002:a05:6808:3a0e:b0:485:41fc:71e5 with SMTP id
 5614622812f47-4854a1b168fmr8201246b6e.18.1779699713443; Mon, 25 May 2026
 02:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr> <20260519095042.B71A1C2BCB3@smtp.kernel.org>
In-Reply-To: <20260519095042.B71A1C2BCB3@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 11:01:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLka39zfp9r5y42AdR9Cf1hzZY6AXu2bPYSLFuACgCbLeg@mail.gmail.com>
X-Gm-Features: AVHnY4KVVMg8n99EqjTKbdaYql3Bwxn2LjMKJnrDIFNuvNoLDl-cZkQ95p6kAVQ
Message-ID: <CAD++jLka39zfp9r5y42AdR9Cf1hzZY6AXu2bPYSLFuACgCbLeg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:50=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> > +     i2c-muic {
> > +             compatible =3D "i2c-gpio";
> > +             sda-gpios =3D <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> > +             scl-gpios =3D <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;
>
> Does this configuration omit the GPIO_OPEN_DRAIN flag?

That would be:

<&tlmm_pinmux 22 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

Sashiko is right, I2C is open drain by definition, if this doesn't work
something else is wrong, please look into it.

Yours,
Linus Walleij
