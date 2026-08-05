Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B13E1218;
	Wed,  5 Aug 2026 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913677; cv=none; b=dn+0K20quGlRpsnvXtQpil6vBXh73YUhe8JhHAMZNiTngvx87Erf84ge6xyAiaZJcRkBj38zmBaittNLt7iyRxAJkWIg0nLARJOAUF5sAIItXhaIxtaNs6TmSnH7fC4ytOG2OCp98PkBokQC51MlAtjrO5lv98SLSR+ksbmt5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913677; c=relaxed/simple;
	bh=F9q3PZ5BH1xf1JI9B6kDUzDuy9GW/PXAiYJVnNZJ1So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6UiFbll6T8LavOerOt3YoKBaiFJWrBKTeu5hfge1kWCmVWm9bBncAhLczuE5/iBTWOb6Bh2fF4mgR5CdU3pW4HIxU1Hj6p1ceoVXl2mxz27cxnhBqpLmfbud166hoM3c5S8k/gdme/MI5RvDHa2fbHelzLw1r0fCl0FhaLs3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI2c+xAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI2c+xAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BDA1F000E9;
	Wed,  5 Aug 2026 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913676;
	bh=F9q3PZ5BH1xf1JI9B6kDUzDuy9GW/PXAiYJVnNZJ1So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YI2c+xASsx4fBpn+7vXmuM+Ol1qyFPm2FJfOj9cbxdgBe6XIjB29dcQDIT7s0dThJ
	 Uflw70eV/uLvAhwNCvyqwPKQ+ckAPD9nkYnhSIrjd7r349mtD6O+qopB2gBkV/n0+F
	 jzFUnKtWjBnUUu54vpb5K4vLAPuP6x+D6RNEbk7r8wQXbAeM9C+FGfNbXGwAYecs+E
	 EZD3LR+CtpokQG7J4wWqn7dZEUj7cSKzrCYMomABe4t7/oc+8rpR5hPeH0vuK+24OM
	 1xIIqW7YjYvT1awkcy1zU0RDWhXTqdN0RHfzjU2SjnigaMmAuDFSQL8WA8zB+zvsnF
	 LvxeodoYqaJ9w==
Date: Wed, 5 Aug 2026 09:07:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 04/11] dtc: dt-check-style: Handle sorting of
 top-level nodes and properties
Message-ID: <20260805-amazing-magpie-from-betelgeuse-3e12d3@quoll>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-4-6c9776928cea@oss.qualcomm.com>
 <20260803092003.D6C771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803092003.D6C771F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:20:03AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Spurious expected error line in a test output file will cause the selftest suite to fail.

Ack, rebasing issue.

Best regards,
Krzysztof

