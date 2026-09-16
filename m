Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE804DA9C7
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591435; cv=none; b=W9ZSFXV04pt8WTUas2sPgTS9fp1TZa72DA8V1pb20b+GgeyQwQXbEmQtuAo3k6eBwOwFY3KSiNRqXWmyCS51VIdfQpF2YyN/9IIl1MyKqxLxpVK12noZBfv3i6nOTkzqsTuvJ1bnyz53waJjEAa1hV3eqSidKNZGcz63lN7EfK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591435; c=relaxed/simple;
	bh=vlKw8zEtmmpXHVJ2WbaEoKFzRUul9RS/PINyb7V/eQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYbohfLKpzsRuNnsXD8WQRINb+NAMT8ZFWHZhWtUIII+v9PSKOUKalG68Z9IEbpGdAVwK2oqfzM0+R6h/QW9iwiY2Yyj6G82HUyRvdLMnutu++TqfdhoIIYqiAtmLJLWnAMpk0boN0gr76ySp6lRpwiKtwDT93vIuaN8h65OSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVB9fqJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVB9fqJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007D61F0089C
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591422;
	bh=vlKw8zEtmmpXHVJ2WbaEoKFzRUul9RS/PINyb7V/eQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lVB9fqJWheO9fDceuY9FUHAufMdiJcNDYVZ1Y8gqb2Gk+/BkKAe9W6RR7tCRDTM+g
	 1JU37mIjRzcQJrUxOHlL29oisLJ2ObmQ2/V0/sGxRSZRif7LWPRncUeTB3aoOhdU7H
	 1RZhv/ujVAspqG5s4IsSOi+eWj+bmqqNgsjmgsSkZiz1zxjb43DIl2HFX463+shE7Q
	 wYB7FQinhFxr98L1BeG6eAT87NiHNsfL+qWxt/dy3Yw3dawHsFKvZ9NsFHj4fNk7yI
	 tjaGcdOflxcZtMV3Gsv6qNsEUZ6iC2fvOxF5Sqqo1q28UK5r9QAMJtxWu0WMSPrEOi
	 IxPZ9bKbQM4OQ==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f7db0so27444766b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 13:43:41 -0700 (PDT)
X-Gm-Message-State: AFuF++kBSlxrQuv9XCsMgqlqgAAIpgPzXMEMIe0Js+42uxCJpNOH9Z1f
	8uE56NAwMnRjB0Fbo4zAg1HQ5L9rUPasvZeFQtzjWkLqLyMeq2NW49rG9S1vKmXcyAutm6Lo/UK
	oxi36CFc3XO2ioVGWXAI89PjN1f9jNg==
X-Received: by 2002:a17:907:c78d:b0:c29:43fd:e43b with SMTP id
 a640c23a62f3a-c29e5392d7amr305474666b.28.1789591420459; Wed, 16 Sep 2026
 13:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com> <20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com>
 <20260720212401.C2BD31F000E9@smtp.kernel.org>
In-Reply-To: <20260720212401.C2BD31F000E9@smtp.kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2026 15:43:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJkL57yUCF41BJvsoJkhhRb8xnukdtxe61fXB1r_7gK_Q@mail.gmail.com>
X-Gm-Features: AcwNN1WDsCQvtNQUN8sanOdeWarRT8BUGDlcRUxPHV8tyHR0Hu5vmuAcP9BJDpw
Message-ID: <CAL_JsqJkL57yUCF41BJvsoJkhhRb8xnukdtxe61fXB1r_7gK_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node
To: sashiko-reviews@lists.linux.dev, frank.li@oss.nxp.com, frank.li@kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 4:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] The `usbphynop2` node requests the wrong power domain (`IMX_SC_R=
_USB_0_PHY` instead of `IMX_SC_R_USB_1_PHY`).
> - [Medium] The `usbh1` node is enabled by default (missing `status =3D "d=
isabled";`), violating SoC `.dtsi` practices and causing unconditional prob=
ing.
> - [Low] Missing required `#phy-cells` property in the `usbphynop2` node.

This reported issue is now a warning in linux-next. Maybe the other 2
issues are valid too?

Rob
