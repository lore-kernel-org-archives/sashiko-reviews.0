Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A43C0621;
	Wed, 17 Jun 2026 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684004; cv=none; b=TZtuA8ocx687I5j69O6IUXgTRSGjuijcDXVD/7B1wOlDbCNtOmhp/eEqiRR0qLw8u1eEC/4Q9LtnshX+YHWxgKQD58vZJUfedqXNr5Y5WImBtBimoQc+U/dHZYmIiYyGGfgZRP/KgkZIWPpb8dd43FaKd5qCwXz8k2Jit2rlqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684004; c=relaxed/simple;
	bh=IbPJGthCUIWDIr4yDGyV37GcvhhD1fZOC0aZZ1pGYNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKV+ehBGJIbQ5NRmvICbQsp8h+sV255LKfV/VnjPQM+wBKO/HZo3F4J3YRBtA8qVD/d1sG99OAyQKmtAGe30LN4EIjViCarrHcx3e+mtlH9ClKvG4NBVkiZN8VnHtg6RN/1awK6Y4p1QCaFnU9CP+S71DNyL0L9LliX13yyW7sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuW6jAzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuW6jAzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E97A1F000E9;
	Wed, 17 Jun 2026 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781684003;
	bh=IbPJGthCUIWDIr4yDGyV37GcvhhD1fZOC0aZZ1pGYNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JuW6jAzRSuE5+tI5/ckDh0EkpYdZXD8bTNc+4HR4p+qzt8oHKVjray+Ra++avQsuq
	 /B9ShX60QfFuqz+hbcu2BTAHDpcwIw8ccAcDBxaiIsiorFAHQtD0kxNQnt0SgF981O
	 QowYPYs4B1NtWf9GIUpN8PlBFpPJdvoyBo0Pb7u8vHTzy5mSEytna9Vq4w42M5zFlU
	 SCMFU42jluJ0lkgMxeype753ZkxzUiayVF/ov5xwwr9aAOxJixPr3yMQysvvjbkMCq
	 /VKdMPdFiDRu2Cdg9L0bJ4CWhR1QyJDiV5C6dPVowU0Va7RGLQJjg+RqCEagMTLadC
	 P/vJUuA/Ui/uw==
Date: Wed, 17 Jun 2026 10:13:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Teja Sai Charan B <tejaasaye@gmail.com>, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Message-ID: <20260617-practical-blue-collie-dd94ca@quoll>
References: <20260616085659.12809-1-tejaasaye@gmail.com>
 <20260616090404.534451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616090404.534451F000E9@smtp.kernel.org>

On Tue, Jun 16, 2026 at 09:04:03AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] The node name in the YAML example uses a unit address that does not match its 'reg' property, which will cause a dtc warning and fail `make dt_binding_check`.
> - [Low] A stray file `result.txt` containing intermediate search and build output was accidentally included in the patch.
> - [Low] Important explanatory text about firmware initialization was dropped during the conversion to YAML.

Please address Sashiko reports as well.


Best regards,
Krzysztof

