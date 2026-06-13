Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BBF21FF2E;
	Sat, 13 Jun 2026 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781377348; cv=none; b=OYKY5dAkyjIncPq0FJIIpm6BEf5lhVg/lxnfaflHvoBOUkAX8VuOKzRZqO1yujDjGhudDp9ORc2ig/A0Kkvhs0vn9ivwZMHG6XSe3TN0GqB3wU791IG3jEY8w1grWWIsn6eFEcooPHzrgcS8epj+SUMLSfIuLZwfvNJ5Doaa2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781377348; c=relaxed/simple;
	bh=l3Oc+tbr/RhE1rUi1i5Q1Q+ay5emOzkZruu4ZXSwpfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVRjBdGZg+8lQ9YkPBUTBI0qbU0Aa0JMlJlUeeJ7CPk6b/AdAfBOocLOOWXfGiXTcjkEtcyVAtu4vSV8LppnGFwAC0MBwNDFlEj0fmZREQR5BdGXYU46QDfxnuMIEhno2z6pVWgJsMNEz/PqGv2apR/gIzWaKp1VyTRIpAR//Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOXRVzde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOXRVzde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780D51F000E9;
	Sat, 13 Jun 2026 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781377347;
	bh=BcueLZkozm3anAuTSQFkqhfHePtuZIF+/of8GypqbT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VOXRVzdeV+qoT8b1em0T3dLm4ZNgf32iqp3M2/ykzIUWdtfPAq6Hd7lRGatcqgZeH
	 53XROkmhLfrEqkgMaaTFcktT2GhQ9PZ+FuOs4ZtXMIi0O0p84dc5knPaAWOUuKxIPb
	 AzmUslwj5K/wMRyqJ+FqgWDuFaF+ncSaDLIPAAWiTqt5hBIuXOM/i0ty+0dcBK7Tak
	 ghZ4uEFerie7Ae/BJidh2ly5FuurM9spaIYqPK86QrzmCndhLpV5etkxmetePJEcD+
	 0sHAbu4Z3RskolY9Lip6JJvTVZmxf0K9XjSOkUqW/OI9Ta9r25K5wGULJVBjd4M8u7
	 7pPQ5tcMf6VLA==
Date: Sat, 13 Jun 2026 21:02:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: st,pwm: convert to DT schema
Message-ID: <20260613-stoic-ambitious-quail-9ea946@quoll>
References: <20260613-st-pwm-v1-1-458c2c89709a@gmail.com>
 <20260613071327.BE3101F000E9@smtp.kernel.org>
 <84be047f-350f-470c-9680-179805152e1a@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84be047f-350f-470c-9680-179805152e1a@gmail.com>

On Sat, Jun 13, 2026 at 12:50:54PM +0530, Charan Pedumuru wrote:
> 
> 
> On 13-06-2026 12:43, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The `interrupts` property is unconditionally required by the driver but omitted from the YAML schema's required list.

interrupts were required by old binding and you should document in
commit msg all changes done to the binding with a reason.

Best regards,
Krzysztof

