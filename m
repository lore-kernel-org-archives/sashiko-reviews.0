Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46FA3D9DC8;
	Wed,  5 Aug 2026 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913591; cv=none; b=JyvTcmgbzge5xNMxxkdVITQ5wLOck+B5WrG0jwXSP5v4jbaaPHHvqTqwhKvi8WV9cXWXAmCZkSwuhinZylzvN9x+ThfMYdEQmH+a3yiUeNzyVZRHbdMllzQT/u0XWWZfqBHSObRS2Mec8Ju4P3pJjE/PSL1lUfB93iFi13eI7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913591; c=relaxed/simple;
	bh=gz3QOOAYFg89/GQLFbGPJdGe04x6/BmShDYQXNwUbps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2M9NSOAcqIN94vSmQ4uNdt2DBJ6ecUxSj1vzENKhnAkAMcL7FHwL3U09lyf3gJRi1ayfenaSPH0Hr3c/a20XIGun0Cpvfi5OlanqiNYPc1xguKbOBfbITB+QAUguUakCI4GVCGOTu5Ntsdn/meTGOP5v/Be7b5wlZgK7dmKMFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vp9GjQBE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vp9GjQBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD7E1F000E9;
	Wed,  5 Aug 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913590;
	bh=gz3QOOAYFg89/GQLFbGPJdGe04x6/BmShDYQXNwUbps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vp9GjQBE0nxuAzE/a/dtXNyiou9Smu8yX6SFj/xHLinqyQyXg2pdMxHQfEWewCzbc
	 ykWwIvygjcIeOrsJgBalfb8kCcoZfABg3mD/gURnVkW/KICOGp/4h7RX1MLhI5a9kZ
	 T7vJHqOaX51XmUGx+rKTZ40LqQykJKom+3aMxjnMonkWTmediAN/IEMJ3Nf87G78Hg
	 vjvC1k8VX5BVqr2hmLASy3OYjCsgMZWlfVEk0vJIQtml2WqDwNh46xtw9bFwGF3p4T
	 xy43NnB8CdgHau1o5arNPsel31V5zIbJIP0xnjfGMfL2vWWyjCvuDeXUTXHc/C84mC
	 gfiQdEUGLcJhg==
Date: Wed, 5 Aug 2026 09:06:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 08/11] dtc: dt-check-style: Introduce 'stricter' mode
Message-ID: <20260805-fortunate-belligerent-alpaca-ad5ddf@quoll>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-8-6c9776928cea@oss.qualcomm.com>
 <20260803091619.827961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803091619.827961F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:16:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Top-level nodes with the same name but different unit addresses are no longer validated for correct ordering.
> --

That's a proper idea, although not a regression. Not relevant to this
patch.

I will add it to my TODO list for later.

Best regards,
Krzysztof

