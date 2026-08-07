Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE20735E95F
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113812; cv=none; b=gpJs/c/JLJ0eIY62TLq2PfjtUBiR9zwLy7yaCYzsv1QRTtg7e7mPK6O+Gqmcheeq6oPReRPxx9KdqqojZuVP7phGpJHzwo5LztpG/KgWyJVV8WGf53gdj2VXpZGDH2zBbhRDTarn6A/vL3sYuR8MpZvYEF/neTTdyQjE8NTCWtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113812; c=relaxed/simple;
	bh=8J7X4bC7srpt7BtuAthIQ3qO3yZkJcIo+hXqN32RRMM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gbR5G/n4xu5lZP1Mks9Esa37AWEB+ZF/K8TCG+tj3XEV+r7Q/z0+oDTdCxa95y+WqsUXGYBdFDRXihSCKjFTTRMKH1CqKyEiPzJmX0n+Fi9ONCvCGnLd7oSU+eFqMtrOuAaJhMvPe+mc0HL+ynXtLr3EkRbo6Ott3dD4u519N6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GrkSgrtS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GrkSgrtS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ABCBE408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786113747; bh=dHXW1gOcUuJhhq6B93P+MF5l5SyFLJfWplXPidiVx7A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GrkSgrtSDhCfTpCYuFPPaa9P7BCMBQBPrBSrRr0tkW3whaDFHDsqZsvkV30dG7/Gc
	 UZzV1tVI9ofaC2gfsOjkHc+fBdsTOTStRS5qFBp41jFV3qhWKH/dWfht6lZR9tngcm
	 15rd+QXLDY8EN/cKzzovgyNftWACWA5nz4Tgs7tBlwK61dEbV+CZzDx9fYgIPpCil6
	 dYnfTbN3sEc0lXjxLnIIsidQbnWV9BC680kda9n5HccREEzigpGqQrntFOvVESjMYC
	 Z8Q6iZRGvN535aj74S3x1XDZt5PePlcne7vx1bT0UuuFjbfNA0hR2BE3tYi+m8i6E6
	 BdpjPhF+C4q9g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ABCBE408B3;
	Fri,  7 Aug 2026 14:42:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alison Schofield <alison.schofield@intel.com>,
 sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: python: abi_regex: catch the right exception
 for a bad regex
In-Reply-To: <anUotMOFSJpBTtJh@aschofie-mobl2.lan>
References: <d57d3ddc0d7d883bd61ad07c6d3969b622fd446f.1786058698.git.alison.schofield@intel.com>
 <20260807000345.86D851F000E9@smtp.kernel.org>
 <anUotMOFSJpBTtJh@aschofie-mobl2.lan>
Date: Fri, 07 Aug 2026 08:42:26 -0600
Message-ID: <87v79mkn59.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Alison Schofield <alison.schofield@intel.com> writes:

> On Fri, Aug 07, 2026 at 12:03:44AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] The patch replaces `re.PatternError` with `re.error` rather than catching both, directly contradicting the commit message and exposing a misunderstanding of standard Python.
>
> It does indeed catch both by simply using 're.error'.
>
> re.PatternError is not a separate exception because re.error was
> kept as an alias for backward compatibility.
>
> So yes, a bit of secret sauce not obvious in the commit message.
>
> I'll wait a bit and see if Maintainers want a respin with a commit
> log update for that.

[Almost missed this - said maintainers respond more reliably when copied
on the emails].

Explaining that you're catching the superclass error would have been
better, certainly.  Respin if you like but, in this case, I'm not sure
it's worth the trouble.

Thanks,

jon
