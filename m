Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6F37C11C
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910055; cv=none; b=DfKhc3MkTr0qUztv9p4HqdwIK5NRHpVjef22yLQJzIHsn2Vw29VnE+Xz3JRyQOGTW7zO4CjdNfXas3ojxxfZ9n6HOg5G8AgqnUVhSlvqsZwGU+PsdxQ9H3vqbUUr2ChKqMjFwgmw5W1tIUfklwuUbiX9WMaaPfvjfsdY4CldIoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910055; c=relaxed/simple;
	bh=ZmnrvnkHizPzbah+hHAnGYHyMU3oO35rETDwgQUv8nM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JoDh7HJ73mrb2G/sPyKYIRGCXg4Uyt5jLdfo5zDAXu+GRRvm/TF0plI2poUJpPX4GxRyNmSAxau/kXKIivkL+s4kbTCwOpmqcishrjKYiWK46plf7f1TaYOkdbFofbZ0KCkqNVDY6cibujkwi26Cbi+URYGdS/PFwRDYTKZgAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=o4aE2ZoX; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="o4aE2ZoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787910048; x=1788169248;
	bh=ZmnrvnkHizPzbah+hHAnGYHyMU3oO35rETDwgQUv8nM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o4aE2ZoX8MfAqEXFx+u7qM1gPwogP44ahKbso2hrxDoVIeSYmne409h54dt3lyI0X
	 weaqizSWBdpaMF7f6BQCj1tdUGnL/9KonRVVVupJIT3Wbi50Wy2SNvpjNbviaZQM3O
	 1+AJ4X2mlp7wogl1KVHylK8PIZcE9bTjpcIgNJ741EolePnFmcRO13tOzY9D0VQtRk
	 GxHsr6yRBDeltrgatRCXUxADpmj1iQCy0LFQ9VJhBy0sPYMfBNyAroxsiU+hVyxgxM
	 OoWmAJthh5gXcX1kozUDgmpT7Gg2GECpHtVve2SV9//ihTWjxWi1bJkwSG6NBaTmKA
	 evqWWc7nihziw==
X-Pm-Submission-Id: 4hWYKW0Wycz2ScNM
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <devicetree@vger.kernel.org>,
  <robh@kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH v6 6/9] iio: accel: mma8452: Reuse existing dev pointer
 in mma8452_probe()
In-Reply-To: <20260825083802.C3D821F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:38:02
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-6-9b252804ee80@geanix.com>
	<L6z2_8mrgRvVwG5aZBq5LTTYkeXmAEBX8ycp5-n_HC7aAydrlcmzV-c9zRFNEULDUJ9zsbkbReCbJJdj4F1eFw==@protonmail.internalid>
	<20260825083802.C3D821F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 11:40:46 +0200
Message-ID: <87tsoey44h.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Pre-existing issues:
> - [High] Device teardown accesses powered-off hardware and causes unbalanced regulator disables.
> - [Low] Unconditional assignment of PM callbacks causes dead code when PM is disabled.

I will address both these issues in a patch series following this one.

/Esben
