Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAB3E2756;
	Wed,  5 Aug 2026 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913798; cv=none; b=XwqyiGgHSEYpdORZ4Q65Llquzogcm/tN5xPoa3WncgaJpHEaWKpSteNRIMTwbEyuc9f2O5ncEIPzJnDPXBRlH1z37Wn8p19jt8IXBnF/B4kyvrsUeccE8ejcFVRQydedPMnrPDaNHXvE4VokcaHzqng3/q1LsdQsIwmW7Y+/7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913798; c=relaxed/simple;
	bh=79alu/Lzm+Uluv06cS3eHUxOPjLAdUZGWpkKbOTIQZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfX2hvcsTsZI3q4cGNn5wgHGKClp7grVE2WoIopjhkYNBJfRdTMiKBfaccWBbp+7hGy2Y347gPw7LoKlLN2ehhh9AN/kQ4dXPbydGhFtpCcg7asRO8GTqs/F9lKMq+tJs51VrEjSSaOkvSBJUys88AnNB3bxrLR5zMoWbqTUU4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSBI3/l5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSBI3/l5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D8A1F00A3D;
	Wed,  5 Aug 2026 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913797;
	bh=79alu/Lzm+Uluv06cS3eHUxOPjLAdUZGWpkKbOTIQZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bSBI3/l52IdzSjRl0rI92b0yM+a5lFy+CYVMax8A3RFBMffUrSvEme01M5V32HHbY
	 kWLyxsk3/J61tV64R6l4yKP22duXHU+3CEmJMUP0TEvdWVEmA5+m7OpFAztBd/D0iZ
	 H+Fusdd05SVVoqsBWbkRQjmuhCyIMZ4agdEA1Z+nIaLHxqMNtvboXhli0xhVwYmsyE
	 MqJTQvCPdkxsMA9+RlWb7Mh0Zo6GyMifK4FpDKjrDEjfH0KJ/t73e2d+h94roMfsKB
	 fihZRHDB05co8iCm9QM84VMlTcFv7jCRQi3+tg2Q8CJsRvx7ZN7DDQhu4GLlC2shGE
	 pCdPsiqOcBfdQ==
Date: Wed, 5 Aug 2026 09:09:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 05/11] dtc: dt-check-style: Drop stray backslash
 before quote for continuation-alignment
Message-ID: <20260805-petite-complex-cockle-ee445a@quoll>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-5-6c9776928cea@oss.qualcomm.com>
 <20260803090906.E30441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803090906.E30441F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:09:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incomplete fix introduces inconsistency: The rule description for 'continuation-alignment' in the RULES array was not updated to match the new warning message.

Ack

Best regards,
Krzysztof

