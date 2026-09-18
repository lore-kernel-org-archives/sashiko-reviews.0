Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6152FABFB
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720620; cv=none; b=NlWULS13CZubSnmLWkhK4n88pFaSjcGXt7k2mfdlNm/vPLpJkZ0HSFwwSe2b8xprNOBKigB6uu/HaoQj6lOysyxlFVStyNSbqoLtkbfxaJM6OzbCXr5vZb9ha2h4wj5QlXwtEMriijzc3TIwfrprP4l2aL4i3vpCF9kpNDOh328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720620; c=relaxed/simple;
	bh=Qaa+87nptui0AXsimzwsvpylfwIPwaERKMaDQTkWKjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=na1wwEpvJmKcPirX9H5YkHEF2J90Lu1YITewjXstlSgl0uHUwf6D1vK+DurKuSrG6qz/DJF3UTMMgjOzdgIhEUG9+Rhk0951gq0vcadse8ZJ8BapLxOwHVYWsi5nGnlLxPLWVE93OBm2FffGg7R/qwzlfBE26bB3Enq09NfhZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZ9Iun3K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZ9Iun3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F59A1F00899
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789720618;
	bh=Qaa+87nptui0AXsimzwsvpylfwIPwaERKMaDQTkWKjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HZ9Iun3KYaqc5PQ+YropUPiJfXXvwv5wzUfGr1YP1ExS8WZFFkI3epYaz/wd6OI0R
	 jM2BJHlAAV2M6yaCx5WKghFP8/OkKSW7KYwy/UXJ7DP4hMk9ZhvW18K/QACNYiYFan
	 i1ei+4s0wBpIu380N/F7wXwN3NFsh6JYdfCWAhNr3TVu1NVdTlHNNiMdfNzZT1XU7f
	 CTgnwLfaq07VXEI5QbuIdaDAYybUMI14W2X3SDOR+X3hvWMg7WKgKbrg7+n5vzsKts
	 U5aTBniHZiQExLe2si+Dmu276jeJAbmEJ7QGKqOvnVw/KCLG4ry88b3luTt6+lKN5c
	 nsKZsexst413Q==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so429753e87.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 01:36:58 -0700 (PDT)
X-Gm-Message-State: AFuF++m5D/dszjBjwZtbuG2/87GDGzrD0M2UM9RZL1UgjjErSKGyd1Lc
	IvfEnTRig0g6hERgdsfg7t8zyWrWdB0yX0TprJzCgnIwnpfJtnGPUxtVqPvO6/c+tOW2iVHHFlG
	dAAQDZ1nFTi+3T/Clli5Nu/xS75O2dws=
X-Received: by 2002:a05:6512:1596:b0:5b6:19e9:faee with SMTP id
 2adb3069b0e04-5b8c17eff80mr552686e87.7.1789720617332; Fri, 18 Sep 2026
 01:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-5-88d29416e3c3@kernel.org> <20260917230329.BC95C1F000FF@smtp.kernel.org>
In-Reply-To: <20260917230329.BC95C1F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 10:36:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUObU3PBnam+bWSssx_Nf4BkGUnVS+eDuEPZdDwUBSng@mail.gmail.com>
X-Gm-Features: AcwNN1Vdv-5dFgmQiAbEZSVNvCH-ZByTPvn-TCXgwC2_y2I_TNPL34t_nHuHRxQ
Message-ID: <CAD++jLmUObU3PBnam+bWSssx_Nf4BkGUnVS+eDuEPZdDwUBSng@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] ASoC: ux500: Remove the MOP500 machine driver
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 18, 2026 at 1:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] ALSA: devicetree ABI breakage due to removal of stericsson,snd-s=
oc-mop500
> - [High] ALSA: ux500: mono streams fail with -EINVAL due to rigid static =
TDM slot masks
> - [Medium] ALSA: silent loss of audio on kernel upgrade due to missing SN=
D_AUDIO_GRAPH_CARD2 selection
> - [Medium] ALSA: ux500: loss of cross-DAI synchronization allows conflict=
ing hardware parameters

No-one cares about this. The old code wasn't working either.

Yours,
Linus Walleij
