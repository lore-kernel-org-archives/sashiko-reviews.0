Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E171A6811;
	Fri, 28 Aug 2026 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900540; cv=none; b=mqwwa5ubvIDJkvhzHNqUBiELk173PiY0vwSgVVjRUG6eh7ORkoNYb+k1Vn4aNYYL3ZYAYOkJ7le7J27zfUnUZ5crYKPeUI7NUkmVyJxE5YnZ+U5WtcJXc3WPUDl7FgZkp5jhBSutteiQd8iEUCmH51YvvnFoJnsE2InI2vrV5KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900540; c=relaxed/simple;
	bh=9xgs7Iax5q0KJiL3Pg4z9wiTQr/l1xFdf7V9vYiRKuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5O2QrpJyUM4HnuB8Ldb9dMNsmga/+6uJz2686d4XVIheZfUwRAGFUB3urcC8obBvtnwPzdGI7osKWvizcx5YhbCjwOnZEW6BdOtkgPeYoDOKtXQcl9isvOpjb4jCxE2uflLtkEr0a42wzCJoSI4oD3TtV7yDoTMy6z6wv+oNLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azVK+oh3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azVK+oh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DDA1F000E9;
	Fri, 28 Aug 2026 07:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900539;
	bh=9xgs7Iax5q0KJiL3Pg4z9wiTQr/l1xFdf7V9vYiRKuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=azVK+oh3LHfkiOUbTm6lmZn16DNCV2gBjosPfJJs3FtvsYr7i44no/otdMOGSIUmR
	 B1abOxijIv1EZ3mTQHjHM0/EdURjzM0sSMJg/cFLZKBuardItdJSago6e6xX+DxHtD
	 ztCEQOlogVAZL6ukQC+oZXh1vISSxUdrRCK3Qo/AqofY5ckiSyQXQebaB/M4EALc8F
	 PCrxHg8T4j16S4opcmYz58zb9PCRRL7EnkVXEU9D6hE/ub4gbh0Ig86b5ItYN4Ouvw
	 ad4bSmRP4473VMmbtx1xFoOFdrWoKmZDW25Vt3N3mT3GyYy550DrIg2tRdvORU126r
	 kYo7Y55WuiXhw==
Date: Fri, 28 Aug 2026 09:02:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ahmed Naseef <naseefkm@gmail.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <20260828-memorable-papaya-cassowary-1cce75@quoll>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
 <20260809081553.388851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260809081553.388851F000E9@smtp.kernel.org>

On Sun, Aug 09, 2026 at 08:15:52AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Top-level `additionalProperties: false` incorrectly used instead of `unevaluatedProperties: false`, violating schema inheritance rules.
> - [Low] Missing node labels for `&pinctrl`, `&chip_scu`, and `&gic` phandles in the DT binding example.

Both can be ignored.

Best regards,
Krzysztof

