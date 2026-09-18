Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B594B4A689C
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745359; cv=pass; b=TPfrdbQXVOxzadw57QLJJDQED1LA8eefBlD8U4AGIJ5HqeeQ4ek1nf9vEhU9cbLIFav7kVQ/xsM4zLM2Nf1//i1KP75DILAELkEjaiCSiQIycVWs7dpUqnoA85kMecbthN6/ndLeiveSbkd5YnAp6Ln3rDMt71bdI9wXzC134b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745359; c=relaxed/simple;
	bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJzVb4GQJHp5hZO6+fPWhK7gGVAfguJcTnPDtRauEiy8hA/am3I/Kb/b5w3arqv2umoBNZlkL/HEiYCvxZk/wlxv4RXwAudv/aJ6rsVLrMBOdBs4jJf5YDcgpBB7cheUJOnUm3cObhwnmb88hGphhBa3DwXfBhxtX25wERiZ+3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXrIBn40; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXrIBn40"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20c35ffbso158961d50.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 08:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745357; cv=none;
        d=google.com; s=arc-20260327;
        b=K5ltgfS5HpxTVdWBL1ewl+kVZgkidcBiuX736eYJSJgXiZmb5xmNw/kFTk/H1FXzdO
         FIukHe2BD1H9VoHbHF0HN1XH73xwIoAp8A3tsb6hv3vHG5fcgnXQoF3SJFTPPlm+XOTz
         Zykg6lVpmPbo7t+h2rlbY46oyNOkEBNxhdKpZ65c+4HzmlcpEzqTQWYhu6dkQAre1WRy
         DD0PFDoUPmWpMc+3M3rly8q/i5TvWZ6tD1qx3D8RTtt1Ku6PL+UHYAbaZlwmX+5pTAyl
         8slllLOpX8YQD7UsbWLS7Smuvujbp7NQQMyu78fV7WxzmjFqe8Tldm6KLU9Iv3//EJCh
         uwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        fh=HC1YrwH16zn0tR4YX0CT4SrQUH25Rdge2tXYJaHv3M4=;
        b=B4b8jFtZzio2TMDst8PWxxwZz1TTfUretZT8bOplJ9HZJUEuq33V1XsiqB74BgeTtX
         OUB9b+8fYN4maUi+GqYSMST4nvQCiSsUifeLEgbe2V1VLP1roRiseqo6xyfPrxF1oqhP
         YWrtEGMiE2JIfUdBQ3QHxcH5baJc21RyDA338y+5HEP65rIlKl9LiFSq2imTCKu520o+
         iyVkzhEQPE+J4/M+obLvsp2Xss4AziRp9g9PxiebNuXz95+KR2eay2InOmTQ+WCeYyZk
         FM5EfFkvmD5DU/1P4bY08OHtrY/oGLPqlRDgz4b+ymVhZgwkTIfP/0OFvvSR5XMDHv1O
         K5Ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789745357; x=1790350157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        b=lXrIBn40CHcwHz2bXjLc5elPqU7+UVyZLyT68pRm7+ZDs6pkfg2IlEeUarGgRjB49A
         rp+zl7tvy62aK2W7ZpM+Dbrnlh743anJi/P0UXGULHf45Mg9Cm9p3baEnqdOW6QWmCH5
         OJaKKA5HZKZ2Uyf8i9x5HRrDKoOyNK2t00Yx9kQXS7qKGaliMAv02U/ss2B4CVPe1m4Q
         vZ8hLab4nTEdC1/OBQJTqS5U+ivjP6Pkvo9Qqyqm1c/U/3V/MEor6Q4/+kuuKdWxz+H4
         I4nAaImRX6OLImvDFa+SdqDbTZ+R7m9L/rmVGO68ldu82w4BYnBBiOA9RbmzdIsy0VPf
         l3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745357; x=1790350157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        b=meKh1DrD/m+Ea5aZCqbpWSr7WhOx5Wrj7MuWRgaI4ySuSkqYHAwc5/MxUFOO7CHtKX
         5aBqsxwGf27+vVvMXFzzfN41VtOt83gx1y7r3KSNkhQ9eZK+x3g1W5Las5kTQei5kXuu
         rRzWhxHCC+u5nymBzma3OUdjRcCBKmBbaPm0YNm9fWOhOcXdp41Akrq+dDTMt5Po9Akw
         PWbaMeuUWhminsTC3APuXu/7Zxg9D59OnuvD3DxuZAKnj6RM8U3SIc1GuqXMWcguu4Rs
         ypvwtOqSBvvYZ+zdqFTPPWzgGoTlaDv5lJ6oezNBlnahZ8DovO6QIDZTRXg7abeA76lI
         JIKQ==
X-Gm-Message-State: AFuF++kdBMZClGJs1aeiXOSGxvmhWbEBCVLkVl5BwT18esNcLAkiLhir
	PE6Whp6S5z2MEdWCxHUadAL26pnRR1tTu40ssdbn6ZlvOmSka41T5bdqh8ukd+Xi5CmrGGQxD6n
	jFGSznpIinyBzNkhXqTggunh6fKgVw0c=
X-Gm-Gg: AYBFou3MYwEWzFAraVhF4Aqh9JpjX1at9NtL3IN2+yANVvLLRder78fbWZtrZynx4oZ
	EooczjQIn7lnOiJZ+Ja64BG5xlTaiZ5S6z2/qmbZnL6ZhGPn7YqrUliQJpB05977tYw+ncjNgq4
	h3g6tFrGyt5I8y0fW+1Pj/xXv89XQeiEazKRkEr5vliLpRVlAUSbkQ9kxjogkX9m/Z8mLmjoigS
	adkDUJCcNhPyhkpffHLwGATt/j6Gr4pj2+1oFrvFrigSOadt71kl25jm87JevUmfHXd4f3bYVP3
	GckFvgWjqijFJ16ZWjOGcw8jgFDOpp3XYo0nCGTsEIdgz5LWo6tAG57Aa+OLWY3SPQ==
X-Received: by 2002:a53:b10b:0:b0:668:9402:9938 with SMTP id
 956f58d0204a3-6717fe09e2bmr1135076d50.4.1789745356692; Fri, 18 Sep 2026
 08:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915113811.2429311-1-itai.handler@gmail.com>
 <20260915115206.CCEE41F000FF@smtp.kernel.org> <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
In-Reply-To: <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Fri, 18 Sep 2026 18:29:04 +0300
X-Gm-Features: AcwNN1XbHeUXrVqj5J_uyPI-friMh8cd1XJAXk3bkpBhx8iPzqwr-5cZFOaN8P4
Message-ID: <CAFpOueRGN2TSNo+m3319qn00p-BYn8w7OQ6OPt4XTcVG63-uUA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: take the flash lock around spi_nor_restore()
To: Michael Walle <mwalle@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, pratyush@kernel.org, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, 
	miquel.raynal@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:34=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>
> On Tue Sep 15, 2026 at 1:52 PM CEST, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] mtd: spi-nor: skipped flash restore on fatal signal breaks boo=
t
> > - [High] mtd: spi-nor: shutdown hang due to ongoing erase operation
>
> Does Sashiko have some valid points here?

Here is my perspective on the two points raised by Sashiko:

Signal Interruption during Lock Acquisition (Issue 1):
Sashiko's point is valid, though this scenario only applies to RWW chips
where spi_nor_prep_and_lock() uses wait_event_killable(). The window
for this to occur is quite narrow (e.g., sending SIGKILL to rmmod while
an operation is in progress).
If lock acquisition is interrupted, calling spi_nor_restore() without
the lock as a fallback risks having the command silently ignored by
a busy flash. However, it may still be worth attempting as a
best-effort fallback alongside a kernel warning log to notify the user.

Erase Duration during Shutdown (Issue 2):
Waiting for active operations to complete before restoring 3-byte
mode is intentional. Interrupting an ongoing erase or write cycle
risks corrupting the flash or leaving the chip in an undefined state.
Allowing active operations to finish before teardown is standard
behavior to guarantee data integrity.

If this rationale makes sense, I can send a v4 that adds a best-effort
spi_nor_restore() call and a kernel warning on lock acquisition failure.

Itai
