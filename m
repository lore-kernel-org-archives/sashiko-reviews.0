Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370F31F9B4;
	Mon,  8 Jun 2026 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949317; cv=none; b=XzQA2OTT09WicYncxx4nfNnbUmXc9B1UxVlpIO2STOBaALJoTzgiMZ/V0rszQ7eiGQq9T3rs7n9CRSJGequ70gT7w7B1vBre7TmM2SH3NMj4+a/g0SqZejhWUsmTmyTA+R2q7pWjJchtrO67U7sxBoPyB7CvIHidgIoilYOhnEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949317; c=relaxed/simple;
	bh=fMjM5wg8cX+907PUCBHky1U1a7zB/P3Dh4DUM/xUIb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GONj2lXmf6GoWPLqppSpp5bG2GSWUvO/xqr6qKspKA30GecaK0SuZTSTqnOHalpO7fO7p9ZusDY08Xv6J0gVgiu6lieBBPWzMU4+gxH0zTJB8VYlJzuHknvoSzded3GSfJ/Ppd+qKqecFU2yMQgJK3jA9DtWVpGhNSRPkBMx1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ji6fq2wF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ji6fq2wF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDE61F00893;
	Mon,  8 Jun 2026 20:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949316;
	bh=fMjM5wg8cX+907PUCBHky1U1a7zB/P3Dh4DUM/xUIb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ji6fq2wFo1VzsLXlE0V1IxLasIXC/gnpX5fTXMb/0XXUim9S/xSO/jlG+JN4Ueh3S
	 kS/iDB/RlLZv1jD7Kfau3gAmbpMySsN9codrKKnZay45XpzJ6Eu+H+wx+NP6VTu20t
	 RIn39JBRGY9HafquR46/2kO/6idHVRHwfxIjitcL5A3PONgI44PkE3nYrT8BzlySD7
	 /gDNbkcLRCpo9tG20xzk/R895Gy5hTkIiom+UWjhVs/cdobSwRu91cTPV0fGdxMCzn
	 au0QEcND01I8UM8s9VRZxgtGV7IB9hOHYNfRKoevOGmZrh1lPQC1Ofa8/6nn644fHp
	 KqV98sgsiS6uQ==
Date: Mon, 8 Jun 2026 22:08:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Message-ID: <20260608-alluring-melodic-jaguarundi-f86bf5@quoll>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-1-0203e6c249dc@oss.qualcomm.com>
 <20260608140650.CF8DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608140650.CF8DE1F00893@smtp.kernel.org>

On Mon, Jun 08, 2026 at 02:06:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] DT Binding Violation: Undocumented Compatibles and Validation Breakage

No breakage although compatibles could be documented if we cared. The
DTS already had existing issue - missing specific compatibles, so this
patch is not making things worse.

Best regards,
Krzysztof

