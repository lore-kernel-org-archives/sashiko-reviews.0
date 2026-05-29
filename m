Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA718B0F
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085664; cv=none; b=EooMdJFDs3oEzzWowHTX2SuwUHFNyn9HMTZFs4dA2E+W6QqEFy2Yj7AepnK0hqJqsVkgmMYC43qFAoWMgmS0Il6V6vJgpqnBoMHI8mQ5msKq4eHX2QIlQKmZQscwZ1EqNhhA4SmmLY6eE8eOhoDNPHynue9y0WMoLKWzE9eue5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085664; c=relaxed/simple;
	bh=R/Ayt2YjYGyvKJqdwZ8WG0Kewd/vVft4YUzx8s8EKIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8e8sFwHuxD5+qCzr50OdwVhRVDlK++XJttSjEM5QX+xDDJSJKmpsDXYMgO2i9+77qH24QE+7ed1+1eov0dE+m3L+3lvs+wOl2Xn9zj9J+F7lqBkoCQ1/PLM2HDnX8Rnp5/9eYSg7jaxXlKhjbQOoWR2qu03Y9LFVze/lxLfipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtQLjXzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtQLjXzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2041F00899
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780085663;
	bh=R/Ayt2YjYGyvKJqdwZ8WG0Kewd/vVft4YUzx8s8EKIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QtQLjXzd16elH/s7HSY0kSs9x2ssgBOOlqXfq476z3gDWVS0k9fQdi0HfIw+3V1Xf
	 Pa0Y0qHpXgW+W8g8EuJKjFeGN9wuX4TRgiqCKkqEd3Kk2y+jPhNjdP3KmLWuTDxMJc
	 6Ql+hNZL5WJlh7RNTYf/AupkRAY+Bp19acE7vQf0C8DltAGMGcxjFLxY0IQNw2cfGx
	 JnOaPhSwFtn7wLXqquO+vwUPeCa6JezC6db10XmHAiOxmHUBAkg26fkE2j5Zm+iS9H
	 3v373wNY8SgSnkK/bsSWKDQlAXggxhNvGWmzH0FySmbZ0Ve9sU6px3SkO4uX0riNfD
	 I8kXS379aMK+Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa5be9ab1aso921928e87.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 13:14:22 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw1uSDEOxqGsO2Xvqhktmo0s7U73AisAolfk1vRGJ6tKJTe/vIX
	EPAgjqKPOFQiBrvbG6a6Ui47DwHvDUY0djY+4fy8mqtspPU65pmPyadtXhzhRmCx70dAJdJPzEy
	OvBhB4udd5vAF+oHFCVpA+6eH6emuMng=
X-Received: by 2002:a05:6512:104b:b0:5a8:73c3:f27b with SMTP id
 2adb3069b0e04-5aa607e3500mr444278e87.15.1780085661767; Fri, 29 May 2026
 13:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525144629.498630-4-jerrysteve1101@gmail.com> <20260525154251.A0E151F000E9@smtp.kernel.org>
In-Reply-To: <20260525154251.A0E151F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:14:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLns_jTJT_QK0DdKj3qBdWcRcgxumC8jWb18KaYGqd+3jQ@mail.gmail.com>
X-Gm-Features: AVHnY4LJG3_0bKFII-IM6L9e27CQ0eVZFCWIzYdaZa5bm04r346MYQHUu0H9Ed0
Message-ID: <CAD++jLns_jTJT_QK0DdKj3qBdWcRcgxumC8jWb18KaYGqd+3jQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
To: sashiko-reviews@lists.linux.dev
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 5:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Incomplete backward compatibility quirk for IS31FL319X shutdow=
n GPIO polarity, risking breakage for out-of-tree platforms.

Wrong: you did not look at the whole patch series, just this one in
isolation.

> - [Low] Use of non-ASCII characters (non-breaking hyphens) in source code=
 comments.

I wonder if that is because the commit message was created
using AI...

Jun, please use Assisted-by tags, because these help to evolve
the LLM kernel reviews if the commit message was assisted
by AI.
https://github.com/torvalds/linux/blob/master/Documentation/process/coding-=
assistants.rst

Yours,
Linus Walleij
