Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CAD33939D;
	Thu, 13 Aug 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613345; cv=none; b=YaVsT+5UFjnHvkMLVEv+1vcizRnUUbdr8jNJUnfQAp4HOXRA96cMmEbB64W04TK/jECDRWovZLVdIzEPnHxwS6f2ao/DPmE8RQ2mFaUe3Tgq167mTahP+8wmb48ECDzL9AyQcNAf4hJ3bkSddnQynJP2SREHK+6QJF1+SOPZWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613345; c=relaxed/simple;
	bh=V7yz1xdUcYj69O1x3V+3WRVc824Oo8kW+lcILojXT64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPxbLvefJ39mhV+2XY++62t8hP6YLrjIN+isGGdgeDd+Wio/uUjvqyKeuLZNAjOWQ4pCiwToMlNhwm/R8w1sO9el50L1a7snC26Z5hTr5KHBRRRy5AUzwX/ti3vht3MH/kmseV7+4pna59CUhRL7Z8Lt3rIcOYZ+P1vzXsyzdHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNUHEzpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNUHEzpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10B21F00A3A;
	Thu, 13 Aug 2026 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613344;
	bh=tzfZOTg3euPGGgReeCodY9rzq6J9GOIejIL3iPZRIAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNUHEzpXTbP9KoV10pLCvQWuw6T015VemhiufP8I5jaQVQcuqS2ymcQI3rJXZwjeB
	 B1IgNXGrkBj0BoXA4Jre+f8rlXCukwimLXggqV1rRSPSpng2oPAWPMHD65cSqKzR0s
	 IX+knzD7HrxrHRLzcVIQwpCY2kLeYrvmSorJ2mIuteQ/m8ksIEovzDAmVvCGfCuB62
	 g4lGSPZY1Cd4vshdnIjYIZId+0XuDXiX94zUq208lkyq0z9//X6/TRV79bMhk55ZqZ
	 4Wi6nPSESEq86SUAg/hhin7RGTon4yWZ1QtSzhjiS4mZ7P7asu6+cSPHpj/cPQcH77
	 B07IcfBE5glhQ==
Date: Thu, 13 Aug 2026 11:28:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo
Message-ID: <20260813-snobbish-acoustic-spider-8c0749@quoll>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-3-prasad.kumpatla@oss.qualcomm.com>
 <20260808184539.3C6601F000E9@smtp.kernel.org>
 <e88326f0-e945-4d63-b257-308cb00df756@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e88326f0-e945-4d63-b257-308cb00df756@oss.qualcomm.com>

On Sun, Aug 09, 2026 at 05:57:18PM +0530, Prasad Kumpatla wrote:
> 
> On 8/9/2026 12:15 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] The patch series breaks `git bisect` by splitting a macro rename across commits without retaining aliases, causing an intermediate build failure.
> > --
> > 
> > --- Patch [2]: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo ---
> > commit 2d0653a87462572279fa5b7912ec981aed567a40
> > Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > 
> > ASoC: qcom: q6prm: Fix QAIF clock ID typo
> > 
> > The Audio IF QAIF clock IDs were introduced with a "LAPSS" prefix instead
> > of "LPASS". This commit renames the definitions and updates their users
> > accordingly.
> > 
> > Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
> > 
> > > diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> > > index f613e2aee75e6..b4f9abbe02cb0 100644
> > > --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> > > +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> > > @@ -64,34 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
> > >   	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
> > >   	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
> > >   	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
> > > -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
> > [Severity: Low]
> > Does this patch series break git bisect by splitting a macro rename across
> > commits?
> > 
> > While this regression is fixed in this commit, it appears the preceding
> > dt-bindings commit removes LAPSS_CLK_ID_QAIF_IF0_IBIT and related macros
> > from include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h.
> > 
> > Because q6prm_clks still references those removed macros at the preceding
> > dt-bindings commit, it causes an intermediate build failure when compiling
> > the kernel at that point.
> > 
> > Should the dt-bindings commit temporarily retain the old misspelled macros as
> > aliases until the driver is migrated, or should these changes be squashed?
> 
> Hi Sashiko,
> 
> Thanks for reviewing.
> 
> The series remains bisectable as the renamed clock IDs are not
> referenced by any in-tree users before the corresponding Q6PRM updates.

Really? git grep LAPSS_CLK_ID_QAIF_IF0_IBIT told me different story. And
it is even YOUR code which is reported by grep.


Best regards,
Krzysztof

