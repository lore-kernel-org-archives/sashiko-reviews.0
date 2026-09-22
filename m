Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992554147B
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079435; cv=none; b=ksWXyrifAhSCWiti/oDo8qEnLZkmbrmjk0YijGdzl9/ac7noU4KbOJsj8+muWPy7F5HFt0Zdaqf23ueih0jPij/kAUfMkbun49vsQjrZgoL9JoMSRLeefk7Jye9R4v1Z+tQ/A8DHINlK7sg4mMF9q3dn2Dnvm7XW2U6Kr0VH0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079435; c=relaxed/simple;
	bh=yTxnbSiAz/ON6hMopB3NB3+oXSxRjwZpBmdV0YxRmss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmOYY9p2oDJ9iI5pG34koZwiJyu34aamlVVvuudkndDpDqBR/lGecRZJpexuimOdc9zEC4N1PRXyzx1MkVTCdmGZcDoLNwt/nKYvn0ju68ULxyhABZZXdzFY0sL5yC7ajWu6LL4XRGKrU84NQUGTR+BrqvAiHu8rsKJIfCYGAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYeIFFE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYeIFFE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEEF1F00899
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790079434;
	bh=yTxnbSiAz/ON6hMopB3NB3+oXSxRjwZpBmdV0YxRmss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hYeIFFE+UckDo7eRQGCMqyMbVRk0RsKmaSBK5lJuoIsqZcU4u2weY4f8eh2+QWCtw
	 GxJNLRlnyvRUiMLcF7eRXvVKb6VPHXGS+4vOXis/ljhS/LeYFKcRUupCaUPEKDrO6g
	 zJdLOGTl6UL9HE6vYYgTy8Im8fR4v8kbFBx0l5FoZtEQ79qICjW45aDZe+/oRWiNbA
	 938/bnQc0CJcBF1wqKYgaGXY96Gc3k7yYxrrUSmVvD2OlfSzjzEEB1MYxza5+H9+pk
	 WvQ/AZzVZ/S1zGKcJ07O/Lzn3lGwEzmKVdvMKJhCOSE0fsuZ50VoG6A3u01yCkSDlx
	 Q7zNNXyxspA4w==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so1486702e87.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 05:17:14 -0700 (PDT)
X-Gm-Message-State: AFuF++mqvlievknBnfuXgqNazo3ygzdL5pZpihI+ZRglX2gjmDZJlQpG
	JOI+IK4Rk+lalByQqYMCzS1rmvxaAJ9UWtE43wNl+8hPlp06hcin1HANqRZWDuMvsh/BiAZPJt7
	Uvrx1J7EamqUmFsklgPrbXhENlOXThBw=
X-Received: by 2002:a05:6512:3ca9:b0:5b8:9a95:e259 with SMTP id
 2adb3069b0e04-5b8d295e4afmr834266e87.27.1790079432863; Tue, 22 Sep 2026
 05:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
 <20260921-gemini-tve200-fix-v1-2-8be03ac2a8f7@kernel.org> <20260921092546.9F6EF1F000FF@smtp.kernel.org>
In-Reply-To: <20260921092546.9F6EF1F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 14:16:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLnMvzC2wmWiLY1aVDHqG39ZiJv2FyCg4-V93APpjihpRQ@mail.gmail.com>
X-Gm-Features: AclHuK-bjk8vEyyJGB6e_jRIydjSMNUQ5bfkMux8cNhlhOVbt-7gvd6Cmxs_sAA
Message-ID: <CAD++jLnMvzC2wmWiLY1aVDHqG39ZiJv2FyCg4-V93APpjihpRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: gemini: Use a level-high interrupt for TVE200
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, 
	devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does configuring this as a level-high interrupt break the driver's state
> machine logic in tve200_irq()?

Nope.

Tested on hardware.

Yours,
Linus Walleij
