Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DE3379EF0
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858944; cv=none; b=uoVlWqyPC7q/rE/ee5Ptu6FwPth9xkTQp6fuKiXsAFBqARLzDfkVTHc+yromTMiJMEkv6GOgY0LgiufLruAsCn9pTcAh6+Wwl/7ZVJ75wB1HFV9GwhmVtmzsNd4keEd308KKzF2z4tMwfN5iW0HftkuI32MZphaDp+fP0S9MWsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858944; c=relaxed/simple;
	bh=DIakRpD3MRJTxpP2zofX57D+mhMT6uR11PFjhe0LF60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OA3J2o9nIyyghdSpQ15NcwsUnafh3X6R88fR5m+3I1bhaANIXEJhB8Y+rPeiz+1Uy3lJ+1Yq0eK1+pdG4KCV70ROazL7t4ctkmi+nRLuPzuGbPxE8TlfI6N7gAOMFUETBiCggK7utsvXwNVaBjaHawvlw8g6dIzp8h9l3DZMFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=uO2JwLxO; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="uO2JwLxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788858936; x=1789118136;
	bh=B77vstwB1BpbPKfXpY6bvp+eKU4SYna+lBo0GBMmsFY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=uO2JwLxOnO8EH+v3MfqfEBrSg0/SKNK++RX21LY1N+0YoR8NogYdN8hffSd30VbTO
	 0uu2LPKoQf2zi17RdVMzSStQrsF1VtwYj4ziQKPPungWcs2QN9xrESRLYFID9UhFtw
	 k9YvvfnobcQTv2dHS2IQLIHb3wOFyYnSKy65XTCl3dqSHZguw+cjqQTnjP50txEBZz
	 pnhc45Wm53Oaps74t9WR8B5zSKhQEo7bjVtJGxGGrczhcSnNeJgnz/R8UIJ84o945K
	 6GZANkD71gnNHV2hwt2Fl1TBiPOYte/GRWlaqvIykyauX86tMQrEcsFzGbrH479fja
	 mL7uTnUsgz72g==
X-Pm-Submission-Id: 4hfJFM2z3qz1DF7p
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <devicetree@vger.kernel.org>,  <robh@kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH v8 9/9] iio: accel: mma8452: Support interrupt sharing
In-Reply-To: <87mrtt8357.fsf@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
	<lgSgGIif93eJ1usOlpNZhgkh3YsQ-210nNAm7LCuSB_7RdMgA45onz0txTfZJrprGgkQjQDLLq8kAlNsIPMv6A==@protonmail.internalid>
	<20260907150846.8BC741F00A3A@smtp.kernel.org>
	<-eFE1Y8Y1Rg3ESQeGhghGI_cdbvweQKDQ0mSHa1IIe6Cez6sEUN35FFQuxaQJl5v6wvGDaKW9StwHZTayRfU2Q==@protonmail.internalid>
	<87mrtt8357.fsf@geanix.com>
Date: Tue, 08 Sep 2026 11:15:34 +0200
Message-ID: <871pb485op.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Esben Haabendal" <esben@geanix.com> writes:
> <sashiko-bot@kernel.org> writes:
>>> +
>>> +	ret = mma8452_standby(data);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "transition to STANDBY mode failed\n");
>>> +		ret = -EAGAIN;
>>> +		goto out_restore_ctrl_reg4;
>>>  	}
>>
>> [Severity: Low]
>> Does this mix goto-based error handling with guard() cleanup in the same
>> function?
>>
>> The cleanup subsystem guidelines state that mixing goto and scope-based cleanup
>> creates confusing ownership semantics.
>>
>> [ ... ]
>
> I will try to convert to scope-based cleanup to avoid this, and see if I
> can create something nice with that approach.

I hope it is okay that I delay doing this for the next series, where I
will introduce scope-based cleanup for runtime PM also.

While it is best not to mix goto and scope-based cleanup in the same
functions, in this particular case, it is working as expected for now.
The only scope-based cleanup is the guard which is first in the
function, and is supposed to be run after all the goto-based error
handling, which is exactly what will happen.

But I will try and rework it to use scope-based cleanup only as part of
the next series also.

/Esben
