Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767584CC267
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769340; cv=none; b=BG2a8Pe3NKkXIs30MGpVvmlfSphpao7Sije84lns88ore6j9qzfQmJ+bSbM9zfvq4px1yGQs6mE3KTqca5E3UjIkewnmJxk2lGtPSjCP30fj6j6CY7NSuvByAgfkKyXWDfiCqBCVjaqG445iVelNxMGG3soG1wC5xTHGyQYN3LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769340; c=relaxed/simple;
	bh=nLdXedgOlaKTYZqL+91P/S1NVvNKOuWF6kYoLe7C17s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEvmYp0elTACYOlHAAMQfxOrA29rwju97g0YoX/C+x22S3LoMABBGlfoKsBS7hBjyONQZivn0UW+n0XqKedk3Dl9ZvFpbbLyFPQpesMTR/wU1GP8Dw7dN3kYQJ+L0CUiml6QeZ8IsLknLMjLzS/VK6Q2yyeZlSeLUR0T9NlfWrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsNLh2R0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsNLh2R0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2731F000FF;
	Wed, 30 Sep 2026 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769339;
	bh=p4u5VH+Ao5EgWA0EYmnPkPH95U+2DNMB/xIQNS53jKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsNLh2R0j5hLWx3tJNJ5ZH8rh5IkVgE/esf0wpyu5lbGL0hnk3D3mEGEpvdgJDIXW
	 AueSm7cDblkQS8V+XhaNfzE6EZmLG1oxuj47AqppYDwrsZWSrHBJlitEDs0cX9jRZb
	 xqjmclSZxe5HOc//Uy9glXqzsuw5Rk9Ko2jCcg0S17i1y7HvQThb6VTqpynLoFs6MB
	 fpv1phYxYSdP5K3r/Qb0fdnx/BU1cLi7qqQ3pCYq2CPIsw6KnT3wi8azxCukFFlrcZ
	 sGD9pEa3FZiBNrPg6b6zY3X2TSuIgIz2jJBXP8lVlbTyVleeTWhh0G+b75nZLS5U4Y
	 RB4jME91Saozw==
Date: Wed, 30 Sep 2026 12:56:10 +0100
From: Jean-Philippe Brucker <jpb@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ryan Roberts <ryan.roberts@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 6/8] misc/arm-cla: Set up memory translation
 context
Message-ID: <20260930115610.GF480985@myrica>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-7-ryan.roberts@arm.com>
 <20260717110214.64D881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717110214.64D881F000E9@smtp.kernel.org>

On Fri, Jul 17, 2026 at 11:02:14AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Will this result in a build failure due to strict type checking in the min()
> macro?
> 
> Further down in cla_op_access_reg(), the code calculates the max register
> using min():
> 
>     while (nregs > 0) {
>         unsigned int reg_group = ALIGN_DOWN(regidx, 8);
>         unsigned int max_reg = min(regidx + nregs, reg_group + 8);
> 
> Since nregs is a size_t (64-bit on ARM64) and reg_group is an unsigned int
> (32-bit)

reg_group is now 64-bit

