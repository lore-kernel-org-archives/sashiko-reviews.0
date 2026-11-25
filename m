Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623997;
	b=kBUOiLu0uJX/+2dIFXYD4Ne0PwA/OKAQOPeVAmOBMlHsfRop7Wt+Q3g9MHyB2UOM5p8S
	 nPDR3TyWc5Wq75vr3PizQOWrbDJU5fXAohVlPz5eMs2Bqo3WqR1B1d4Pos/5hdStc/M+8
	 Q/LT1CbrqnMaKILJKHxhgBwUJfoll2RN+Hhky0CwrNXuetk+K6P+joRF4IaE52eSr5jQ8
	 DgYYHa2VSj6LsHYCZG7TeGZPD/W80OggFkhuI/ITQdDTEfrgwXFKBhISGLJf10B7FQh0H
	 Je3T7/0HsKjp/wfQdV9Bg0r+pea4/28ifRd74JrTpg8rm4Y2FWdMzukAlJKYm2rzaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623997;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gQ4dWEwpgcq8XaO874dWWeVVziSNkBxKz3Y1ekE3l2k=;
	b=smYdIOnwBIbbSMfCRU2BG4zk9IYjuvVS1ruyO+ClH7Am6Bwl44VeclIfd7ZIK7WZODrW
	 soqfRU2ysW6QfGJyzfrFgOIUJeFqhUFIk7hWuUbddtCD+olQZLxR4A/+17RtOKE2qHg2e
	 04u5AYkdgGdPQmaGx4g7DmiTvfPxyFffrdM9XoBhUfM/ODXy0qAGRmFIUmx6uTYb3GIyq
	 89N8Et/sV5P10Vkr7KIIuU6eZZ8WR49idArCeAflmzDEKrTViP8Upe0CIOlLe5FnBhnBd
	 8RW61oat4kQvceDmu3pzgWjDoFOrXZMHWxTF06eDltjq7zptVtBGOlJM0uqaB9WUnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=w22kui8A;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F02606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 16:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=w22kui8A
Received: from [IPV6:2a02:830a:f787:8f00:8bb2:f125:24d:78cd] (unknown [IPv6:2a02:830a:f787:8f00:8bb2:f125:24d:78cd])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id D94B953401EE;
	Wed, 25 Nov 2026 17:26:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795623993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gQ4dWEwpgcq8XaO874dWWeVVziSNkBxKz3Y1ekE3l2k=;
	b=w22kui8AP7h1bSN0+oVLvRo4iHTS0y6Af5439ZvMzPC8i0/P3ePdpL49wFeS+CNFrq0WH5
	dZ+Sb6daiR9ydJU+CQvq+CbH40XOau/G3Yxu0ilTshNr2ydmD5JhmBVyK9WTN1lj+3q/uE
	eKBvRYk1ymSL1d8feF819qdYWOsximM=
Message-ID: <8488344d-85d0-40a8-a526-a17fe69cb00a@ixit.cz>
Date: Wed, 25 Nov 2026 17:26:33 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/panel: lg-sw43408: keep VPNL paired with VDDI
 and reset deasserted
To: sashiko-reviews@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-4-914b4a30b73e@ixit.cz>
 <sashiko-outbox-233481@kernel.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <sashiko-outbox-233481@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2026 14:19, sashiko-bot@kernel.org wrote:

[...]

>> +static const struct dev_pm_ops sw43408_pm_ops = {
>> +	LATE_SYSTEM_SLEEP_PM_OPS(sw43408_suspend_late, NULL)
>> +};
> 
> [Severity: High]
> Does sw43408_pm_ops also need an early resume callback to re-enable vpnl
> when vddi turns back on during system resume?
> 
> During system suspend, DRM unprepares the panel in .prepare
> (dpu_pm_ops.prepare -> msm_kms_pm_prepare()), stmfts_suspend() drops the
> touchscreen's vddi vote in .suspend, and sw43408_suspend_late() then sees
> regulator_is_enabled(vddi) == 0 and disables vpnl.
> 
> On resume, stmfts_resume() unconditionally re-enables vddi during the
> .resume phase, while DRM does not resume the panel until .complete (or not
> at all during resume if the display was blanked before suspend).  That
> leaves the panel in the vddi-on, vpnl-off state across .resume, and when
> sw43408_prepare() later runs, vddi is already held enabled by stmfts so
> regulator_enable(vddi) does not power-cycle vddi to recover the DDIC.
> 

I ran automated stress testing for all states, and it seems it's necessary here.
Report below the line.

 From maintainer point view, if there would be need to make it bulletproof I can 
explore Option 1/2 to address it, but hardware-wise it seems to be not required.

I can send v4 with more verbose explanation within the commit msg / code, if needed.

David

---

     Good catch to check the resume path, but hardware testing on Pixel 3
     shows no resume callback is needed here.

     The non-recoverable DDIC state occurs when vpnl is dropped while vddi
     remains powered ((VDDI=ON, VPNL=ON) -> (VDDI=ON, VPNL=OFF)), not when
     powering up from a cold both-rails-off state with vddi rising ahead of
     vpnl.

     I explicitly tested the exact rail sequence on Pixel 3:
     1. Both vddi (ldo14) and vpnl (ldo28) off, reset deasserted (the state
        left by sw43408_suspend_late()).
     2. Re-enabled vddi alone via stmfts while vpnl remained off, and held
        (VDDI=ON, VPNL=OFF, reset=HIGH) for 6 seconds.
     3. Ran sw43408_prepare() with vddi still continuously held on by stmfts
        (no vddi power cycle).

     The panel recovered cleanly and lit up normally.

     Also note that an early resume callback (.resume_early) would run before
     stmfts_resume() re-enables vddi, so enabling vpnl there would either see
     regulator_is_enabled(vddi) == 0 (no-op) or unconditionally power up
     3.0 V vpnl before 1.8 V vddi (reversing the power-on sequence and
     leaving vpnl enabled when no shared consumer brings vddi up).
