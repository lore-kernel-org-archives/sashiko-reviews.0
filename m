Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4CF274650
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785369506; cv=none; b=h0vPydUdZ8TLkBdylDgPm+Cwl+vtCs5dlAg7E5zbMaJ+a7eQ5ey0gFQNcXtrcF64W4V21xTynmK4KAUMv7qKQxoy/UrM+qFc06BBsRKtPDXV37cCLYvc/D+YFCC2eGMfnoRhvewZnJpzw39Ul/MhXOnP8xvQ0OBpv+1T/HkNGr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785369506; c=relaxed/simple;
	bh=mITtomBLnwQIO2MC4PVSup2YEZqji23r2xvfeNuOs6A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRWgQ+7m3IL7xNUK+ItP1oheL5Tox0L9EhnbkNiCxjJCPnVoImIcJ/Ydqc+oUrhPu+kVQd4KFZxHj9fpbB1jFWIch0P2eQWYnbAqF2UxYk5JpZ4Zm8xni+NZicurfIMgJuJ8U0QlS0PX1l5rkeGJGFKJzNdAA2NKXFrmJa9peMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OSXfmLyU; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OSXfmLyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785369490; x=1785628690;
	bh=mITtomBLnwQIO2MC4PVSup2YEZqji23r2xvfeNuOs6A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OSXfmLyU5nhzS8uvUq6zRtV4xzxyzcBOMM7/YDWcABGyLOV1Gsl1XhuB85mu3UoLD
	 QRNx7wX4f/Nsj3dqng1wjdgWOC0onE97ewl4sA9aPM4bI2mJEKeb3aEZsk0BNSYhsB
	 pxKP4zJVr6/ic8Vk6TdT7uRGvcl/mf7EM6HPSGlqWPFeTg35AkWOWp75oiJayRvg8R
	 vKYUEeFwPwALUjrtXco/MoqsaSp2k7a9WiCtPzdpPR0ID3dA1nd9zo4of7FfeOZp5D
	 HlMfmAy2/irwwcfQL+fN61YHf46mEJrpYUg7iGcX9+Wptm4ODgWOrUZiDU0k2aoiVr
	 dRYOcZ6vhvuQg==
Date: Wed, 29 Jul 2026 23:58:07 +0000
To: sashiko-bot@kernel.org
From: Vinicius Sampaio <vldsampaio@pm.me>
Cc: bpf@vger.kernel.org, sashiko-reviews@lists.linux.dev, vldsampaio@pm.me
Subject: Re: [PATCH bpf-next v2 3/3] bpf: Avoid redundant min()/max() in cnum signed bounds
Message-ID: <20260729235833.376494-1-vldsampaio@pm.me>
In-Reply-To: <20260729200108.BA70A1F000E9@smtp.kernel.org>
References: <20260729194932.292368-1-vldsampaio@pm.me> <20260729194932.292368-4-vldsampaio@pm.me> <20260729200108.BA70A1F000E9@smtp.kernel.org>
Feedback-ID: 138063245:user:proton
X-Pm-Message-ID: 03057c5192427db9c8d103b227cd364b84c9ded4
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> [Severity: Low]
> This isn't a bug, but should the opening '/*' be on its own line to align
> with the preferred BPF subsystem multi-line comment style?

Yes, it does, I'll fix that.

> [Severity: Low]
> This isn't a bug, but similar to the comment above, would it be better
> to place the opening '/*' on its own line here as well?

Yes!

