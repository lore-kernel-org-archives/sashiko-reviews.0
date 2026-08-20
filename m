Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28026395D98
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251488; cv=pass; b=O5qNzeU2RklyWwgTDhZwtUxh2KEXWwNyOxeBa4MxXeh9tDGHDcFBdEv8NKC06eYbPQdjTDCB5d4m08h8fk4X6Z8gqVSwkJGjrAG0HUCGtcT4Oi6/BZEc1bYbRCXO1950dhQ90ZzUzipIER1Yh0b9xHotT1sqrQJ9UGk8HfXwt5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251488; c=relaxed/simple;
	bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvMg/AnGSoJGWb7gJUBZHsU1wdgZXbw0VHQQz9nd8gClzrj5VL5XxhQ8BaKgCdHERIUyUsJzavb2Yl4RDeRA7KNdrG4QHxJ0F0zhP0ye6MNuehTgT3wc4V/3r6tijuG1pAPR3Qw2exqvPR4TORxvPuTtypY12pdC0gTQ/J/g3LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQWBWsNT; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQWBWsNT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-480033bdcf4so154075f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 11:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251485; cv=none;
        d=google.com; s=arc-20260327;
        b=mnCEX8wuKwtFBRPjqA5wWGqMg7qZtMNPsaa1BAWIIamo3Y64TCNvCmr0kki5t4iaWX
         Eep4X2oNh1U8cnJ/SaqtV5bfuDwAJKk1HbunMqWqKfn7YenyF5hBuWb3SnuPKT3eEfxj
         BMFh0sOWisXx86mCHuRPRaocrivAfujAlgeWuMTISLbjjE+xKCrcp7uXlpxwBPSUxLDJ
         /g3UfKpXC0aoa2ahqaqTq0U7f3+F6eEfGXv3OYrB1OAjOQ+pGRzGm+or7p4Qu3Zee1b7
         4zVCpJxsYqktkNGYpVvO5nKNoNw4SoIHfiKoH6kmX8U+bYj7sqpTjme0UKXczuFi2bT+
         sVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
        fh=J2uhi06Dnc8bpWSOt3AGmCPPngCLI991Ezhb9j9TYgE=;
        b=Yi1rTyA3Oas3CjMv8U10JTRLod5C01BDChSdO/z7muwKTmgvPeU4w9X3kArcPYaoIc
         XNfcBj53Z9SvYHzjVDiyNtqaLF988u+XC0+HcbL3zAy+MXKy08Milwc72dWdjy/jGEOv
         GDdzP8GRrEH8DdquX0xnge6f3KDROZdQ2LSnhZaAZs6Y4EUJ/iVHd+nZEexMLk++6t7g
         JTz218u/3h4OP3P6Ar1HbQm1HYsaYlTFEcXbKQZv7I1/g0D4BzkiD3zY1sSlB0LZ2dlQ
         qwcye3dtGyHUKnMlxGmmbw94CUNfnpC/1KdApDNJaIhSTzKqmfk1mqzJGn9SPwoOiXAK
         NcEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251485; x=1787856285; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
        b=YQWBWsNTTjuR9hnVs47f62HWMtNP9GmQ+3cDyIi0x84e4tjFebZ1eWV8O+ezgxo9UM
         Ihj+lqbwf03eTgsPV7nJQuB1RL7i66keV1nWhSfyQCSk+c96Zkjj7T/j36dX5jtqGZx3
         xqknOwHwWkXKYOt9nuhH2sG5nZEnP6vsskE6+m+tH1ZIbBDWdBCtBZBTFheNoF9uEl5i
         nhVAafJ/UTB6iYEkCut3nGdTjo4G+crej8jlbWyyw8neHlysB/Lq+jvB0WrgjG4rL+2a
         ly2WcUyXnNrgBm0HzdNPuy3v9+tHMCzLkOH30JXiAEAlHlzuOK7VECtZdLpibgE7ZRvZ
         O7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251485; x=1787856285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
        b=IymXFFdlERHoiOjBztNuFDREfUBxkFEJ78E36gBLs4ihrIRva5e1rBvGgmueHo7qGb
         VIkG81TeTEicQmUnpDp2//BqZjzUoy7A2p+//ZiP4RRNQ+IkrtNiax7UWUjxDARC9PLr
         rhtk7Tv6G2txNc4WcA4eopgPtomhA9yd/D1ztMQrShpyoP5JgBBBKCNakzp2PbQ6Jc2Y
         CN6dUrA4JEwi9qbTUhgxoKMOjRipptfieo5gyRD7wCUrfAHMj7Jzju2tkOcSQZSuWPLy
         /yFZRX5GTNYtg/hi5hg6kFK1rNsmi97u9ILtwTJ2XwoW951i7jirl1v6NEDOP1jclhoU
         mUOg==
X-Gm-Message-State: AFuF++ncgVpRPaesDcNeOWxmlGYBRkAoyzvIK2bEdXJ4ffuTx7zaK3EG
	w5vaQlPUvCDwdGyhOktsFKSdWisgXV8hxa/PHzA4DkiIqR9sL5QUwuE/wWN8zkqKJ8N3q048Lua
	ndH4rxPdrswW/38JzZYmoPL86WSiXfg0=
X-Gm-Gg: AR+sD12d1hOopIJhsf0ErZY0gxn/SDhu2sqlVfgWJzLGf1Xcyku4hmbObOx1sPEOQDh
	2IECLPctDon62gkEEf7Gr8aPy74N2j5karT4WdwvOJD8FypiPV/hOYdlnSUC1nGPWQ9tD78BhzC
	iWkm+uaD6yv/bJhObyZt4L3nhXLcuH6xS9dNDhV7ahD9vGQGtLmNtsyT4rAmCb/savtGK7yx7ei
	e3kq45iogMUyyKxafCWMIo2d+ll5ZkDtPsbOZnKrmj246uE8r3k7QPqdYpQ7HQlFNV4nFtUT6t6
	0iMLpY6RgPmHm0eIuaMBFIKHWk6gYZDkN8rXCXqZ2pV2CJFKHmY14Mi3/6Na9KdsVoIRnKlyoe6
	N0RnhQSxBWw2GZt/gilXGkuC3A0mi/w==
X-Received: by 2002:a05:6000:2207:b0:482:a610:7a27 with SMTP id
 ffacd0b85a97d-482c0b9d152mr1364137f8f.20.1787251485416; Thu, 20 Aug 2026
 11:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819104926.DBFC21F000E9@smtp.kernel.org> <aoWq7VdKlAl_jGQQ@shikoro>
In-Reply-To: <aoWq7VdKlAl_jGQQ@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:44:18 +0100
X-Gm-Features: AcwNN1Xgp0Pu-QrUH3se_72By4o489NWiytQVn666RbDbhV3ffzDpMM0wJcWhPQ
Message-ID: <CA+V-a8v09jMv57WpbYbJfZ0SxiFD-d-9-+=iXdWN++G9hv33yA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK
 for register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:09=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Would it make sense to wrap this value with FIELD_PREP() to enforce the
> > compile-time checks and stay consistent with the rest of the patch?
>
> I don't care, you decide.
>
I'll leave it as is for now.

Cheers,
Prabhakar
