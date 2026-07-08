Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF11F130B
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503970; cv=pass; b=HFzOHejWe8BY2EkmWdAjksgtUZv/yZA4Tx+6Jb+9oDLS6cJ5TtRts5S6fUSPYZxfp0+ku9PjJc7KWdWkCUf2vO0SycVxOdmyxc2lJOU/TEMbAI45EM4aGVlJ7oeXHKuUl7cnHDHd8d3TqLg8I6VbirDzhcTCDNvk8qLH+/WGa8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503970; c=relaxed/simple;
	bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CK6mkXNyZE0V2HFRO9l/PWKDrFq/6NFiDToX87LbMps6ow7PMUhaS9i2jm9NvFZ9fheIdB5T8Nj9OSOcGfjVb+u3UnSInW/xC1Hy+Voc02cX9V7jJHiYNRR91HTubm7udqx6coqvqAUADg+noZ9OqFFJEkYp+vmn00lpDTAGqCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hjO/ETES; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hjO/ETES"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb63dbd229so311499a34.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 02:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783503966; cv=none;
        d=google.com; s=arc-20260327;
        b=qfwFTRIC76rYneT8vklT2XBAqOIrRDfdLOY8XaXB9KB8mTpTqZbqajz6AZaSuTMPLp
         TQppmqMPsewHteB1f0Ycy08nWhshkWfEVbUZY8mdkSXG7gUpQdpMbQRc6qKgkVT63yBz
         V1zBRUfYEDqktgGdpRrF9b+sMl3D/haix40CSi7xMzxuQPYKxwpx4uWOd2sNXURsHMtH
         hqC+12DLKPEaJuHtbQRlu5gmzU5TmMoz4x7dI54jxNtNYaWIxBIFqXbSxrXAnpRty4kk
         +wr138mRXuLSUMJoCuCGJ/QGyy2eeFqpTioiWzd4sPvRCoPNw2ct451+7g4iO9iBkzIV
         sLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
        fh=BekaVLBSS0Zi8d6+26hyk9mcrYewb1hL2NkgWFLUsc0=;
        b=XZCK4pq7Xk1Tw7OL4iBFfpFxFZ9EhX4aRhbE7xOXewkGPDu+nUXdakNZ4aS0k3KxPj
         fZbX9liBmqqRCkeeU2CuwG+wsTHLW+Xr0BKIzw8an9CdA5aUUN0xwkty3Zd3L+L6JGQm
         sbIW/wGu2behQLcb5WDB+943JvsbPsE34EBl/zNluGTGBevaaMiLhydm3vN2wpb9S34h
         s4hXtk+Wsd0lOb9GkRfU74Wn2kldGOnQq/5TU0taf123/u2aZ+TD3lIed0ARiisvKFSu
         ZaAWMqMaAWP6zUCdHC3pyKpH5hDrJWtbmxMC4ei4gilEeUjv2qoLoh0Lc6HEwXpLuciV
         K7Kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783503966; x=1784108766; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
        b=hjO/ETESfy0llHn79Dwx3+C13hasoboxUrGCs2xBQ58o4aIfow832aJgCzdhg7Dpyt
         64beaAJc+6KRh5DrQMfQBk2UrconGKRTPGb4y8VAy7Z3ioWimKV/211nD1zP5+E6hFlh
         PpPbU9r+V5eC0s6dZVPxMz9omWmop9JmNZDJeWl2CxHng7J4CKoskdaZ+J5qfqQu29ck
         ghIiHzCG4D1DXGq7VWvHjNMHqU6L9UoLWjJuHEzy0yZU7d4/bjp28PSb/89gMIVap7a5
         1nkJd7ux3BceVuYdv74tSgYXo9oQu4XwfjMyQeDhUxI4ORAryzcqQDhugDtcc+jvhDCe
         BYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503966; x=1784108766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
        b=EkORop+ZmUuMX73UJ749q2eiG//mzmmvKTYOlCG4Gbe2NGeTBckBlxeOEGvmIfA8wK
         LQIJQI+Pw7fFEk4zFJkuC7Cw1pODr2nreaLv2JHBsERlt/gwjGx4s1WKsTmbF0acXq3t
         3qjnkCTmXgZvmDJfOJGYwzMmRppG6gguOpXrxCvq3jDxEETi1bxgVB3BMdE/sHNdtCkV
         BVVhql1lBmf2D959etUoB9ahRSmRRv2KW+LTkPGUsiZ0Ur59WAKlvax+jfi7+UJJQ2i6
         7HeJ82TFwIY8d+/Y17mXATzesaekdvu2+6WqbxGzg7EtoYB78BBp3xy9VnupQTxgJR4Y
         D8oA==
X-Gm-Message-State: AOJu0YzUd/e+7CUckU3vhxgo0GS/c/yC1IIm/OItAf37nx31FE/6QtlH
	2dPHYDNlNFDz2h0xJGOY6IgsYz/fH/EkjqlYzzJ2FDcSXUzQYnfToHnzx07SqQUuSW7RpKOaiib
	lYxc5v3iQsPf5rUcGnh7DNicVtYNWTF9nwSZpOevxKSgv+ElrR7dMcSzydQ==
X-Gm-Gg: AfdE7cl5oNZ0ozgbxWLz4ddApgjNtr5CIcWScn1m68jFQKgeGD7Q55yuvxjWTRbML77
	8/W0DQQp9Ko8PTPXTqKLNyo+7bwz6qEGV2xm1aQsJ2PtspKtO4J5ZvDsLQNa6R7QH/ipbI9YnAk
	RVBSbrHjv5ZFlCI6e3bXSJ1tgGQdjyXPmTm2f5pM/FKmwGBE1krGHl8wt/a+OaFsgIeLeBYudU9
	aed7GqeAMyIuzDE9fvYMi0OJ27OeGgie9FeahUPSHhoHl1i7GU+HSZLP9WYbU+EKA3xss9K
X-Received: by 2002:a05:6830:6585:b0:7d7:fd71:f2d4 with SMTP id
 46e09a7af769-7ebced3469dmr1159039a34.3.1783503966285; Wed, 08 Jul 2026
 02:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706114731.57353-1-ccaione@baylibre.com> <20260706115959.2119B1F000E9@smtp.kernel.org>
In-Reply-To: <20260706115959.2119B1F000E9@smtp.kernel.org>
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 8 Jul 2026 11:45:54 +0200
X-Gm-Features: AVVi8Cfh_EaTJXwa64517rQoRlvBJxx-iFga0XbQN4X6x5I9LAbdYeR2RVfh9j0
Message-ID: <CADh8LsfpTXB1jHtRaOTySyVvcjOL08MRfMP8OCZzZiZ=o29y6A@mail.gmail.com>
Subject: Re: [PATCH v2] of/address: Fix NULL bus dereference in of_pci_range_parser_one()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	saravanak@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing upper bound validation for `#size-cells` (`ns`) allows `=
np` to overflow to a negative value, bypassing range bounds checks and caus=
ing an infinite out-of-bounds read loop.

Since this is a pre-existing issue I'm not going to fix it in this
patch. It will be considered for a follow up but for now this is
out-of-scope.

--
Carlo Caione
