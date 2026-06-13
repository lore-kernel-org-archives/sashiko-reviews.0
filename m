Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2D2C21D8;
	Sat, 13 Jun 2026 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338106; cv=none; b=CwTem6xeF0CMb09ak1wrk+JueFOe1DD6IB3dw0X6xujeOBhT0IeFdTBrFflsOzsf9Oed/88+kjvFHayu4RT7fLpaz/fis5R9mSNEfAPZ9FPrG2x8tByfCsKtFkZF0/lA4N+AdmE4SnHxII48gtb3Egv6ZUkO/BtbCdeRfu2UmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338106; c=relaxed/simple;
	bh=VE4+T4N7WOnhry3IAw9l1qq7n7sftm0pSjpqaPa9VeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3oTULwNAsx82bsGQU/vAQLPGVE2ZcIAKyqnNaHZouEBoMN4+zM7QvcI7S9nB9d93fHmz9VNOx7m8u9eVlidRhGTUP39IGT0NuVbsrH/NgIk6CtiF+aOHVrv2HnCHmbMp56BN55270kZbwb5CviMAZV+yuIjO/z9N71Mfcc/oRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsPffsTn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsPffsTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617DF1F000E9;
	Sat, 13 Jun 2026 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781338105;
	bh=VE4+T4N7WOnhry3IAw9l1qq7n7sftm0pSjpqaPa9VeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bsPffsTnIS61pVOUg3dr0cUrTGr44RNykTvXFaBVuivyAtBOd+IsPMfzMLUNJrum3
	 RsIoVf7cyUd+rTJEtw4TnCdrenUa8c4CWpDHGXlX7DmZEhLtM3rdLJKDsp7o/W3NuD
	 XFqu41UYOgjO3HuhZ5/jP9hVKBW67EOwSGt3JedQ29zHKKopHNVt6ZC8yuxtjXLPV7
	 4fMuaONurreDqoYwHaxNUF+Y8KLJlW0UCTxe68Nrg75shu4s3SM9gCnBGoxVcNe21R
	 q3qgk4nWZ07CI2ZtIj3A5M6oUcdyIam7RWl0bbaIHW4wgxY9i556d/eF/ac53dTL00
	 yA3s0i2nkkG1A==
Date: Sat, 13 Jun 2026 10:08:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
Message-ID: <20260613-cyber-basilisk-of-agility-e254cf@quoll>
References: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260612091614.E963C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612091614.E963C1F00A3A@smtp.kernel.org>

On Fri, Jun 12, 2026 at 09:16:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Missing Compatible String in Conditional Block for 'qcom,pmk7750-gpio'

False positive.

> - [Low] Missing PMK7750 PMIC parent node in MFD bindings

False positive, sent separately already.

Best regards,
Krzysztof

