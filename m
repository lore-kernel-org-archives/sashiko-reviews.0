Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA437AA70;
	Wed,  9 Sep 2026 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940756; cv=none; b=j2xhWe5tCSrJx39QaxLMAff1QllSuyxZ+lXCglYf7mLVERwWCKLt4/gRTGEqD9b2wlwkeJYHcYsldMnOonSy6ykinhGBxeWHBTQUDYhVlWcJ+nC7UktM6x8t8gRajnIg0Yn8N+ex3tggFDFcC+2vztHvSvdFdw35nSqNtp06M1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940756; c=relaxed/simple;
	bh=d0OS/gcSBtD79FghC5lEAvRzvjbPjZjrHfHbaN6oSYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ngrwnd+BxBNKO48jbrNvoLGuQHQ/zyraFAN5yx9+ugy3h4m+XtIMb+/L/x1Aqj72JjW3hbhtVn3V5kJd2zQWd+JqYE4CVurt1TbwDWSFcd8FBriggdTP3fjm1iexdjTU91H0Q86FLUnURGQeajgpZSTVEYVtx/0gEHfbX9+OlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLB3Cu9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLB3Cu9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA8F1F00A3A;
	Wed,  9 Sep 2026 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940754;
	bh=d0OS/gcSBtD79FghC5lEAvRzvjbPjZjrHfHbaN6oSYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BLB3Cu9jiypADXMohR9yF4WKqcNfE0uoAs4QsbA/fMSw/L41C1S2RwXHxjlH/2626
	 ExJGnCqCNxICg4ERWY5a6vMdQTdj+LMrqaga2XhCNG+Xwcw66CJQ8z4RImqKF8VRtP
	 EYCb0hMEVZ2ql/iYm7ATpp8gfqxqcg+NgxO7HM5CgZ0mFoH6keV0OpuCeAYIkW3Wu/
	 BaaZbb4zXU12XFkYrjfN68N5opkDa0f24TtADvyG9b6t9F/CaDBYFwhWeXOplneLHq
	 QU8D3RE2oCJUq8n2YO390sgv7V3z6B2QAD5ch/WqWWISxeNTsV6PipwS6+z9IwWk9F
	 ttDV7a2hoyrwg==
Date: Wed, 9 Sep 2026 09:59:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/3] dtc: dt-check-style: Properly detect comments in
 multi-line properties
Message-ID: <20260909-juicy-handsome-wallaby-0cad87@quoll>
References: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260906180437.166760-5-krzysztof.kozlowski@oss.qualcomm.com>
 <20260906181533.203811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906181533.203811F00A3A@smtp.kernel.org>

On Sun, Sep 06, 2026 at 06:15:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Reclassifying pure comment lines inside multi-line properties as `LineType.CONTINUATION` causes them to bypass multiple style checks (line length, trailing whitespace, hex casing).

Partially looks correct, the logic in rules (check_xxx()) should handle
continuations as well. But OTOH, mentioned above rules do not matter for
comments.

Best regards,
Krzysztof

