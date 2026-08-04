Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E84446F9
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839941; cv=pass; b=Ee3JfPZrR5BitkxXKkEfz/2KAs1nvK+A/j7AP6uJ99hCNNBVg7YjKsMeAwCICULBPNLDJG9MVNsVchgGr4QZhghCmi1OCuTPUS2NckyQmxJmJp1xqquJbV8xyzP8wds4DLyEZ1y6Pza8FsAqVjn00w9KTEkQkGT8bVAjzNvVVvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839941; c=relaxed/simple;
	bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCKelTF6so+09ssYzaAtYWg/lZUSTSESVLa8gEFfdzuIJjrC1zTSv+KwMQ2RzIA6Ky9KKTA7MbyIlx2ANmA1mSJeknfb4PLqtbNLB8uwOprUnihj641fPBvNCCTamebkXwsvN8ebBJZbr2EueXIneIP8ryoGhfEKNVzimpx8yuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLYvxZJ7; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLYvxZJ7"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69fc2261f2bso7135955a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 03:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785839939; cv=none;
        d=google.com; s=arc-20260327;
        b=mvuItHdAmHy47N5VgzIqOWBGkS1rao/aSl5hA0WqAyWYmlu0UsfNjWeVs2x6ZKtSfH
         W7UHRJw4U5bsY+EorZeIVuzD+LjrxV8ddegapQ/JcrOklmKqj/3qY1payv/C3k9eTZvJ
         GjeJSkm/PDwXg90tgUKbtDbVj72ubk3Atc2YOoshJig+5GC5sRUCI83oICUQ4fdkCh7P
         ghUaMHtYLPS4Rcp0YqeuokeHgAczFfRCZkZk0KpSOf31GLxWbLb4j7Hwxx1Ju5yrajwU
         IKOJZ14Xu1P/cVkaWE//H6wcX5i1ADzlmLxQ8bltX+9lPW2Pr9qf7DOcOtcxZgr1RHIP
         pB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=IU/EUiXvIKRw78RInGU/tYwF17saiWVcnkwC8i7YjyK2rGaCaG0O62DF5mIVLawXLF
         F9Bfu2MLiN5EuXfIPyOBFMTXmSp/HgHuxmXA6TTXhOi4rFZ0GEY78Ug9jF4IVy2gIrb6
         AHnYZGxQZ+UvL7v2Q6F6tfYL2k1SxWVu75XJfXfLcunh0k3QoNYPVXvXqojnS7l++6Fb
         cXy9Yg+WbR7LudupWNX/jRYdGk/I3B+T7nrcA019aujqFwGuGFHUIwsL91JyYyycCbDc
         fjWZLZlkTKakDV0LdZMiCI4LI06As1SG+4gY7npaEWPvzqmSR2MdSy69JaVT7q/LmAHl
         47xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785839939; x=1786444739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
        b=hLYvxZJ7VY/8ytyDnIt2Qwkwc3KfzNqO8KuihZ9I3vhD7Yyi/MEzhcyRYqXymcE8Xx
         qxuiVxVBRCgQNNnbUxDVIUFPK1WdtzqUUqBLATnaxtUZBMBe/f66bl4oAg8hD2u8ne3n
         c2A39B+JpPll38NazD2UWgf/rvGSPoXWVty4GZhEGpkE45hnwp8SZE7boz7UIo0o9Hmz
         FmVkpOpEPK+6AqE1CeJStrlBAxRiXZKJ3N0Dtw6mzkAWeYj5K9lHhgZGcac877lWJ+cd
         BIknMF8/XLD3dlE2b/VKgfLr+1aUy6WuVNbRjNu4kIcbnUrNr5b4Tgt4yomfhyjwaAjA
         l7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785839939; x=1786444739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
        b=eE46Epf31Smh981tNeZlOQdX+TTE3JDj3d55TrL6WDhpdK/cXgALHiFyx2nFe0oMl1
         lavCpC7xSeOZBIBMtLWv8P+ZSS0jjrQkedUnDVi0LsW6Ba0lB7yMmYbdLArN7xaM8tYJ
         Q9ffowzbxwCY9MSAo9XaFZFaAZausClxpU+zNMHKPJlh5/bixTaGjrmdpQfsZ9P80wAk
         xIFqxEg+TZkf8NELUowGOOD1OUs04UcsNhcHswhcw6gut3Dhh2omB+eOOpDEuwX/UHmg
         pmIgmI5tR2RXFN6spPkolB56pxj4n89w/X/Ck/Kwte+TuF1SGxRyBl1MfEiocdOgcczG
         aUtA==
X-Gm-Message-State: AOJu0YxksXRGGHBu+5EpORV7pRaH65WcKwdn+ZV2dTBHBOkHoILeVVVR
	K2nFYnoYyPw9CpCRHmIocDs+FgTXLPTRCrVcujVEwdY7YgWqDY19YEDd+Q3zEOUC6gFWMiOPBuQ
	DF03mhHr5mxqEmWOFtjcu+Gvjdu/0veJkkeKF
X-Gm-Gg: AR+sD13Z058aRoce6uy1PZ+obNXWd8n9/YmJbxJ1oJiXxeQ9FfnYGGWzVMBAWYqN8sX
	F1Fbm/xzddKA0ri8QsrYxGHH27uqYR+Zs8Z3Eb7SP6mWyfnSMol6oJLX6i3LkW5zw/hgNStToAE
	z8hxkOirs+e1P/6IsHn3FfgIDfzEO+epUYFFiABAij9XAQmsO5Bpb4wLQ9rC2Jqnot+Ao/DnRBV
	O118YrOj6hfx10Behsv00LaC1l75ZUh8VECSDymcEmyvfsHEGeNpE2SJBVpq37z24yMbRU/AmCD
	OCkLewxFMmHJEemZepeiVpYpl1rpQ2/U2kkdBp3Zag9ZPA==
X-Received: by 2002:a17:907:76fa:b0:c19:fb6e:5ff0 with SMTP id
 a640c23a62f3a-c1fe81a5d9fmr1017103766b.15.1785839938403; Tue, 04 Aug 2026
 03:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <20260803101734.270821-4-a.shimko.dev@gmail.com> <20260804101756.F350A1F000E9@smtp.kernel.org>
In-Reply-To: <20260804101756.F350A1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 13:38:46 +0300
X-Gm-Features: AUfX_mwfcSVcebTIErfjkkWZbedHhg6pzo_BnOzwwfFTZmY6o_KUALSIaBBb6ys
Message-ID: <CAOPX745iC9w_7=TsO317GK1gBCg1zX-OvMF+oeZZaA6501zZcg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 1:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Should this exit condition explicitly check for val < 0?
>
> If dap8211r_read_ext() returns a negative error code, this loop currently
> terminates only because negative values in two's complement happen to hav=
e
> BIT(15) set. Relying on this coincidence might mask errors if a different
> register or bit is polled in the future.

The driver already checks this after read_poll_timeout() returns.
The check is present and handles negative error values.

> [Severity: Medium]
> The function's docstring mentions "Software reset to apply settings", but=
 here
> the RGMII configuration is written after the reset completes.
>
> Does this PHY require the settings to be written before the software rese=
t in
> order to latch them properly?

This was already discussed. The reset is active low and self-clearing;
RGMII configuration is applied after the reset completes, which is the corr=
ect
sequence.

--
Best regards,
Artem
