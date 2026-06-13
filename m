Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78B427AC57;
	Sat, 13 Jun 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375206; cv=none; b=C07CHmXLWRkI+fkVSXMLWHnmWNFkbyqm48dka+u0rdNqmdqbAcFxOkrYr3zCqNYrDCQcOF3qX+2yIWgM8obpMiSYO2xr0EKrFq1OMOXBrYHACNj0aog2BlJ11GwTCbE5HySG5zB7t+JbGuj3fk2i2VtB9uOKDZ0nYMCpTSY8ry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375206; c=relaxed/simple;
	bh=ku69+QJTGLVIu+e2VCsIqu28fqjfc41H9M/G8zxv6Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqwmUhYW3on8CoJLbY8XXAxKBu6mm2+UtDvPvhTMNteAymUzmAQbRSLFkd7kVqI+RY6knBR7zIKDdh9l3cpdb6h8kXv7me3gS/6dB01Muh0LCqK7pBIrYv7hNIi0dbhyqrKPGNP3zYTflznGJngPuvGZHA2h0JJ6Y6fk0X8HKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQkVXJeN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQkVXJeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74A51F000E9;
	Sat, 13 Jun 2026 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781375205;
	bh=ku69+QJTGLVIu+e2VCsIqu28fqjfc41H9M/G8zxv6Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZQkVXJeNXlV81XZi1WUGqWCSL0oIySiPC12pMIN5lENjd7geRmuLD1g/bD1qx8R2C
	 5p1btKdarR9A8uoPI78Xq8N7acGOu40PFJLO89mI+v79YPIi6jagK/dq9ex7/GPhvj
	 kB3AAy9Mmf07tM8pq7l46mQjpgcDU9b7wX2VIZ2ElUkenYa6E0YKXjDHZWUKohqQ+S
	 ns9G87k9DxpS7B7/gmF07gRpKXdy0zzPCR+DVUs1FaVPnhiK6puBPeny0VHiIMer7b
	 3d+7Ra8X1O3eZ1xsX7DX5nLMdueRgmPOz7G+bYCKgV3SB/sLx+l77d1Q4voaDHutW9
	 yAao8KY6h1hyA==
Date: Sat, 13 Jun 2026 20:26:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 1/2] arm: dts: st: align node patterns with
 established convention
Message-ID: <20260613-meteoric-qualified-malamute-beea2a@quoll>
References: <20260613-st-mmc-v4-1-b3c385617c16@gmail.com>
 <20260613094844.EEA7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613094844.EEA7D1F000E9@smtp.kernel.org>

On Sat, Jun 13, 2026 at 09:48:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Renaming 'sdhci@...' nodes to 'mmc@...' in the base dtsi file leaves overrides in derived dtsi and dts files orphaned, causing node duplication and completely breaking MMC functionality.

How many times Sashiko needs to provide the same feedback before you
address it?

Best regards,
Krzysztof

