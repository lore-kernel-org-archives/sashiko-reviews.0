Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE9F1C84DC;
	Fri, 14 Aug 2026 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731001; cv=none; b=EmcCtY2Tlp4Gnx6DqcNq/KFwa4QYwvE8LeDID6mNnWkiwSvZrGYHEnkzEYyzmbOsDDlUPj0bZQfhvuqvcfc/4uTUFqp+m57EQvqH9V5E74XQET6GhJH0sfo2rMeXIGZBN0hSbLObZkD4GZPL5yZiz0/ugrKtqmZNk2lXhBfuRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731001; c=relaxed/simple;
	bh=cU301QmwESeQ2x2g6pg6Owg65Gh2sArBa/Wr0iuTU3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfoTxw6e5+w14wCBGWf1jIsSll7JnXoasA2dH3+l4CsqiOUyQo+cZOze6SjV956iabLlclETB1Ux2VINJdbzs7mYlZ7d+S/8L/5zYfuNVL9aAT195fCKhGbVZUHgv9TiKnMH/PXeL+eNhJHunnHUjCEiinT9I382j97O6t7372Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cytdhDuz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cytdhDuz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00391F000E9;
	Fri, 14 Aug 2026 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786730999;
	bh=/1k+IdRV8AU/C6pEVz8s9MPbFvC/whYePTctu3DVE28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cytdhDuzOrsmNlq+KAvp769lyfJD8j+rjMjpWG0Xe9/WkKov5qB0s5ZnnU9H4CMhp
	 Hm/z5VVcsx4K3RV36Oi7PSYhrBafQ68uNhOT943hca5WYDcOHDP1NexXsntO9bdwTA
	 WmM9prCi5/83u/S3Pedk/Bbmn2VQgQaerxDvLtW9DCGkEHcNMQyBgh5/mWr05TA7Ua
	 TerGXEr25TUbyf7MI7RGveAAHd+qGmQK0D7BeVHx7s3tHN4Y2qjdoRlm4L+V+7ELji
	 s4DilVY43T22otUpjeuSU72Oaz3FO0GApVQ5dXZzDWYLaemB9AzV+H4KVJg3xMcDFB
	 MRIE/7t+dxTrA==
Date: Fri, 14 Aug 2026 13:09:58 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, vkoul@kernel.org,
	devicetree@vger.kernel.org, lee@kernel.org,
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	olteanv@gmail.com, conor+dt@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Message-ID: <20260814180958.GG1981719-robh@kernel.org>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810071224.5AA301F00A3A@smtp.kernel.org>
 <20260810153805.GA1793660-robh@kernel.org>
 <gypuIvsORyye1Tbviu_vVQ@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gypuIvsORyye1Tbviu_vVQ@gmail.com>

On Mon, Aug 10, 2026 at 09:49:27PM +0300, Stefan Dösinger wrote:
> Am Montag, 10. August 2026, 18:38:05 Ostafrikanische Zeit schrieb Rob Herring:
> > On Mon, Aug 10, 2026 at 07:12:23AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential
> > > issue(s) to consider: - [Medium] Missing `resets` property definition in
> > > the YAML schema. - [Medium] Missing `simple-mfd` in compatible string
> > > list for syscon with children.
> > Neither of these look valid to me.
> 
> Yeah, I removed the resets property in response to Krzysztof's feedback [0]. 
> And the syscon-reboot is registered by the MFD driver, which in turn goes back 
> to Conor's suggestion at [1].
> 
> Should I reply to the list when I think Sashiko produced a false warning? In a 
> way it feels like fighting windmills, as it will likely bring up the same 
> warning for further patch revisions.

Yes, otherwise the maintainers have to think about it first. :)

There's not a feedback loop in place though for sashiko. Hopefully that 
changes. Adding more detail in the commit msg might help. If it's just 
blunt info for guiding sashiko, I would put it after the '---'. 

> It does find a lot of real problems though and as a newbie contributor I feel 
> like it is a valuable tool.

That's good to hear.

Rob
