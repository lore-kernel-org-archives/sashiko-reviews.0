Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8641F5F6
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170610; cv=none; b=BxDnGTozLlbrJ8QpxJhLhb9Dw+kClK1I8DPpw5nmEhKtxCoQsCZj+UshDNaVkrGzQj+ECZQfA33/+TIsSqOilAuByEJk3aH1dVPL5KMn9S0Ul3/bvB5yyiwtmW0sG6PfcaioyCZp/d47sYsqqLrheXjSqG2ayUxy2hsTFsu3h8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170610; c=relaxed/simple;
	bh=Hn3J8VhUzYUZT/0+Un7gBK5rZStubHt+5BqBXqPXQRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUtahV6gHyHgE3zC8QEYI2Fn0bu/qU/WqwkI1O2GqeYuOhtyGHm8rPQb6LMKVcshbs7m/8HPXS711afC/9TaEEQf+c8hI3ywjdTxj0BMyP3Pzi0RfHnWkfflai9YkOGJsklmpLFhwoWNchNm9hqB6Cm9sHuYQjpVvm8USmdhm9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdbuoNRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdbuoNRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDF61F000E9
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785170609;
	bh=Hn3J8VhUzYUZT/0+Un7gBK5rZStubHt+5BqBXqPXQRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OdbuoNRTdDhf28FdpGEPhYMHXr3jqg8ysbIX0o5M5QKU/fK3kdATctQUm0E8cWlOL
	 h4l1gounJ1xyfBeVyooG2NmwFY4M4xLGj5nlRdru0XYkGIlHP22oSfBiN9AX074NE4
	 K8YZw0Q8wUtBv2DphdSgaIm2hgogc88RdqhSeIrwpScba+W/XdSiawH5A9SRU4263G
	 Ij50zR/QxgusL4wYR6pr5FvcPdb9/SiWc4bJ4co6BIDSiaLfOx6rBoRCQ8ui7IgXJB
	 t/I2LDTDkTNv2nB//Tz8JIDgjDvWKRiE8OvbN9DbaHFRmFzV1Y/WDJetZIgqaMS7a0
	 HSq7ZQeFjRzvA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c52d920b8so383878266b.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 09:43:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YzKL1oJ255u/fDO+1DRC6ly3B26IDdZogYefYH29YYfAHbA29q5
	UbQE1oammJEM4inR4ttso+cfYbjYSukbUxsxeyoGSCsSX7OwhlmBeuIr71ZyvQoO6DF+3xlLPjc
	+A9pNxDjI1HQD62AtbIC6k34+I3nxHA==
X-Received: by 2002:a17:907:934a:b0:c15:f4bb:e663 with SMTP id
 a640c23a62f3a-c1f1ea074a9mr436415166b.10.1785170608067; Mon, 27 Jul 2026
 09:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-of-range-parser-null-bus-v3-1-be01b708a4ce@baylibre.com>
 <20260727084613.6905B1F000E9@smtp.kernel.org> <DK981PFQXYCO.29SKQ2BT5EOPQ@baylibre.com>
In-Reply-To: <DK981PFQXYCO.29SKQ2BT5EOPQ@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Jul 2026 11:43:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ2rqLzH3=vV8jzmTKorKvuVc-zqv-8+-T7K229ND8mow@mail.gmail.com>
X-Gm-Features: AUfX_myvZNKCOOtmp9ugSjWzr8E4nCAvkOxDTKoXLKIDapdLJi5EtYMk5pBb3zY
Message-ID: <CAL_JsqJ2rqLzH3=vV8jzmTKorKvuVc-zqv-8+-T7K229ND8mow@mail.gmail.com>
Subject: Re: [PATCH v3] of/address: Fix NULL bus dereference in of_pci_range_parser_one()
To: Carlo Caione <ccaione@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 3:47=E2=80=AFAM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> On Mon Jul 27, 2026 at 10:46 AM CEST, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] An integer overflow in the calculation of `np` (`np =3D parser=
->pna + na + ns`) can be triggered by a maliciously crafted Device Tree wit=
h a large positive `#size-cells` value (e.g., `0x7FFFFFFE`). This results i=
n a negative `np` which bypasses the bounds check `parser->range + np > par=
ser->end`.
>
> [...]
> > [Severity: High]
> > This isn't a bug introduced by this patch, but can this integer calcula=
tion
> > overflow?
>
> Not going to endless-ly fix pre-existing issues.

Agreed. I'm not sure this one is worth "fixing".

Rob
