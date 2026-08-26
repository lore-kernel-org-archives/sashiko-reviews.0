Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746FE1DD0EF
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787718737; cv=none; b=mJuo879JLdG2FK1KPfLiXSVVUqKYbDpIPPNGCrCzpF1HnWVe07DHfoD7oUUzJ7BgQ/x7shuecS6lTCR9lF/20EWxtijIEfDnKah/igBHEbfOaav8WIbwrImWqKlwD9nkhkXkMf/ZMdtTrInYYezk8GL9DSdH0oTRIGeEMNyBT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787718737; c=relaxed/simple;
	bh=bP/R0qRwuRYhPdgmtfPE2qJ7BfGoGQBTaSoWyfiZRRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1RltFVp8lEAPE4UPPncmypFquBqNhMO0uAr1NCBhie31PT5QV+nyjFLHSmfGKcZlL0elfn+IdNGb1RZeHyM0vZwSu0pfj9+5ULIeK/pAoWfRCwfZ9UNFvI7czZ4Y82Ly4Lo1iqb/wYbmYqj3ecpZC06AVMGlL4EFz2Em2kfx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4uoKWQK; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4uoKWQK"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8549a96e93cso5335417b3.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 21:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787718735; x=1788323535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bP/R0qRwuRYhPdgmtfPE2qJ7BfGoGQBTaSoWyfiZRRE=;
        b=Q4uoKWQKJ8YDrHUXe48VcVEfOohO1RSAUY8WesUBo1//o927KpaIPceCWqj3Yq6iF0
         hKO8E21r1FgXqf5E3lJR0ZyLLB9fPS/mbNGyIOmXHJ9eKhS/qi6qBSc1uIaqR+b1S4gt
         Agr5MWtqKhu2n8U6CQHBGA+rbgT30lhj7lROqZr0PkxdMsY0OVf1HSGvZiEzABJTUnEI
         fBy82nBrxNYwS5A6Z8Pqszm1RynVcI69ML/o53U1C524eYf6RD11KqlL2vLUBbZdvaaH
         zsoJj3BPgm8MQjNiV7QfpZ4nhkEKLslzgDJkuqFXvvPchqd2NeTarwQCOEwpH9bjduBS
         bNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787718735; x=1788323535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bP/R0qRwuRYhPdgmtfPE2qJ7BfGoGQBTaSoWyfiZRRE=;
        b=ZUGTy4adgj64VPpqlcJVvO5O3Lih304Nnu8b/lNFws1/WanUQGaVscg8qpUoJc4ys9
         UxxrOOtkbHwmUrCxSuc6PjhlNZxYLVG0+7QfVarg6gWKjoJkiadxK+Ouvnf/UvhXIeIf
         oa9bIBuXamYIUaB61UOInUcUpewKVv2yE53qAMBJ2kF5TgYNwkDmIJD8kb+Eu//tWuF7
         ZbCRrTrnblrqWcw2ma9zlOHXOZ0ceUJ/RZvi8uBINhsZlTbtiIjmAxYkUdikX9ipjQZo
         cxKZXVW5R/3vuK+bVA0w7abk67hxRutftzcWWm96VT26DfIYWURFU7vXrwG/8ZDNomnS
         g5Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqzGr0WFsta4JlLK9EUgMAnrIN7fi0aHSGULVOLQTiJy5kDG+/ZbfHfPa5Y9jrWQThfna67MC0wnd84UjA6Uk4=@lists.linux.dev
X-Gm-Message-State: AFuF++nJa0ikeWfKJtM/0kXN6AiOPpomEtMVGVdp2H4pda3j/XdPAmGU
	gw4avIvppp9yiLmeWihiSqeRBHutk6M0Z24PkJr7Psuawlm3izdIsElE
X-Gm-Gg: AR+sD13MLBWKuFU6qxyeRB5/qdo8KsQjljG0FrA4/2l6L6aZ0CfM2PUydkfg56YxhbY
	Gp7A0veZHcVADdXvemU+/Q8P1WIjDi5+2Rc/gDVva+ImkbI1BtuFirMYxsZg4XtrtYx8wp6/yor
	7rdv5RuQ+TFyyFcQl3s5wn3z6/VMXBcje7aTGOujWJjuYJ5Ct7vVodKixeEpJAQKsobmZtkXp16
	facN+VXhP8YwiLCXjVrJspDnljjhoBvY7oSmPjVIXcrn8qiqHqG+DWSW+8BqL14YpOdBGHSmQl2
	FDe//pb0P8p6PMUl9LvA+6ul7Pgw314ZSaLiiqXfFNenpJasOaA+HyxOfODzWLmp18qejcFtNy0
	ZDFvu5HcY4FFKokDCqTfDlvCVx6YgwXno9dHsWPl+KPIa50Sslb89RChQutIRC3IGgc9s8SMGEe
	TTGrUcf3UPsu9GopB0nVFBmEOF4dzrqxijHhQx0e8EQt4A2vE7NIgsBM3HWSlJrfcZhNc=
X-Received: by 2002:a05:690c:61c1:b0:854:d9d0:46b5 with SMTP id 00721157ae682-8573f8e40f2mr18236597b3.19.1787718735400;
        Tue, 25 Aug 2026 21:32:15 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053853absm10609357b3.3.2026.08.25.21.32.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 21:32:14 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: sashiko-bot@kernel.org
Cc: blbllhy@gmail.com,
	linux-can@vger.kernel.org,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	o.rempel@pengutronix.de,
	sashiko-reviews@lists.linux.dev,
	socketcan@hartkopp.net
Subject: Re: [PATCH net v3] can: kvaser_usb: validate command format before parsing in hydra receive path
Date: Wed, 26 Aug 2026 00:32:13 -0400
Message-ID: <20260826043213.49431-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826014955.B9ECE1F000E9@smtp.kernel.org>
References: <20260826014955.B9ECE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 26, 2026 at 01:49:55AM +0000, sashiko-bot@kernel.org wrote:
> This is a pre-existing issue, but does kvaser_usb_hydra_cmd_size_rx()
> need to enforce a minimum payload length for the extracted cmd_len based
> on the command type?
>
> Can this cause a slab-out-of-bounds read past the end of the USB URB
> buffer?

This pre-existing command-specific structural validation issue was
discussed in the v2 review [1] and should be handled independently of this
patch.

No other issues were reported for v3.

Thanks,
Cen

[1] https://lore.kernel.org/all/20260825025011.13898-1-blbllhy@gmail.com/
