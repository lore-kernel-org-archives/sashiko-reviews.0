Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6E20D4E9;
	Fri, 14 Aug 2026 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690131; cv=none; b=SyF+NZUv6UKto8PCyGzvOpW/yiAPplbVOhfIjXaZDh6lDOu+c493t1TYQhD3NpCXgvEzNlcTJh5VOgGaqEBZDdBAte7p52qt1mX43iJS9bqFXq4N3ni8h90878TfIM4Pzc4T7uyPNTSGfRkL718TkkBugdS8sBnzW2egM6Y20uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690131; c=relaxed/simple;
	bh=axDZWVHD0MiDcCeM2RrVH4mOAeRXSZ45xjHfScLtgZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PM58wzqzphXnKyWJ14+vJdDwDbwvwiIQ+Xw6m129cs/wTa8NkBTziyKomqcKMo/tl7kti5iiB/TMojFnYw9kSKAmLZ+qV5lCODx2E1Qb55h8ttW14N6gEpGpw4VjJx6Q3RU5ALllu8PeZWvudtcyMqdZDmTL3gqHKh7kaPfy2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWF2I5KQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWF2I5KQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1F41F000E9;
	Fri, 14 Aug 2026 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690130;
	bh=axDZWVHD0MiDcCeM2RrVH4mOAeRXSZ45xjHfScLtgZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TWF2I5KQtjLJYn5QyepoL/g3uYyU0attNOEUq1tAa2OKB/g/URT5pOkcFL6/M/bPi
	 p9Q/PqF/74XJrb/wTv2qcwhCAZM3FGIuMnINiwUYOpbduLi4e4IQ1ZzqYlQ0dsodbD
	 /MtLHcHyoNK1Y9x++stLIsk/kX4HS3LX/jNLA972/aVvotu/3QRIMftM8DbNnKzvt/
	 MtF/sDJNn7qOouXC0BB+V5uHLvaToKoicXU6IykhID5lIiWik6gK+vqhVoptN2ISLI
	 uFfYxbhw/lmGaqgV9EZTztXvo5dsbbIk4HMBwzhOz+6MrW4orSVBYlkpNEbjuCSiFK
	 vGBj2tmRtouUA==
Date: Fri, 14 Aug 2026 08:48:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, robh@kernel.org, 
	lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT
 schema
Message-ID: <20260814-wild-dog-of-dew-3ccfe8@quoll>
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
 <20260813164117.DE8F01F00A3A@smtp.kernel.org>
 <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>

On Thu, Aug 13, 2026 at 10:24:12PM +0530, Bhargav Joshi wrote:
> On Thu, Aug 13, 2026 at 10:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Medium] The schema enforces non-compliant, legacy device tree node n=
ames (containing underscores) for child nodes via `patternProperties`, bloc=
king the use of standard generic names and contradicting the commit message.
> Yes nodes with underscores are kept not to break older dts/dtsi files
> which uses underscores

No, you made them ABI now without explanation why this is needed.

> > - [Low] The YAML example references undefined phandles (`&devctrl` and =
`&pllctrl`), which will cause a fatal `dtc` compilation error during `make =
dt_binding_check`.
> no this won't cause any errors related to references ( tested on version =
2026.7)
> > --
> >
> > --- Patch [1]: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert t=
o DT schema ---
> > commit f59b6bface010fc243ef7f899dbb8dddf737e2c5
> > Author: Bhargav Joshi <j.bhargav.u@gmail.com>
> >
> > dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
> >
> > Converts the Texas Instruments Keystone Device State Control binding fr=
om
> > legacy text format to DT schema. Adds "simple-mfd" support, enforces ch=
ild
> > bus properties, and adds validations for standard child nodes.

What is the last sentence about? Changes during conversion or explaining
basics of binding?

Best regards,
Krzysztof

