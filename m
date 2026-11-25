Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622939;
	b=cmDRD4mxAPl6QHLgyp3UkXkyQvXoCNjbng+qRf0wtvPEF7K4YXjSLEL1itGtrCIpqDo8
	 QcvfmNEECzVI9NFe+wVwXJptk0mmSkPD04YVseasnLYJBCLE0PRjznX6k1ClkdNenmcdp
	 mAt9vi0szM5hYFxuyIbv27myc6Trkp8kZjCslBoqWpa5Pw/ydQUarVdyb5BDHWtUKAZcx
	 7DmG6eOKE6BWGaHv89vQ7o/sdos1y15Q1GvFYSAfUtwxEaxbAyGlbUOMyD0pD23zCQdB5
	 SIpeIwUkOZcnJQWMUdP+qGgHCd95zrGIExzc/456NThxeQdiRgBgNJBd95wVilaDe8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622939;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=s8H6OjEScw2/UnJ66l4jZ9QFseiSJ3MQbPOUTwgxZlA=;
	b=mh4TqpNgzw3wL6OSvwiNVXdf3wgHSCZ6WQUKeDJF53F8S3cKCOeCZN8rsB4K7OkgJmP5
	 OFn1A7NmHVhzw6p9YNzwbzGDDZMSPnxuEZzRqCpbYn5/uokUx+PGg/xqSPhUlR+6wIyxi
	 LF3k0UHdjclXmqNb4qmvMITqeRpyNd9mioU/YWsEQ0cgCBmqx6oNcqi/WxpzNrnT0t0Zz
	 8Sshhcv85aDeR51J0y51fpNhGLMV2EpheSkhHVM8V4qROBNa7s3sG8fEtxzHoOdWw31ub
	 0bBxV21ANLZIihpobm2QEJV807MpjiVI87gGC7BVGWEcd0qtuzUQYrSyY5R5BuLlBdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b="Wk/h1RG0";
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17963606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 16:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17963606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=Wk/h1RG0
Received: from [IPV6:2a02:830a:f787:8f00:8bb2:f125:24d:78cd] (unknown [IPv6:2a02:830a:f787:8f00:8bb2:f125:24d:78cd])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 3B17A53401EE;
	Wed, 25 Nov 2026 17:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795622930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s8H6OjEScw2/UnJ66l4jZ9QFseiSJ3MQbPOUTwgxZlA=;
	b=Wk/h1RG01OiNNupU83XZOUL48WOiSysR0meJcne66vP/yq/Lki7DfFfkr1r0y8MAar7RxB
	XkvD8znIQKWUg24UebS3dQ42JiaPfOMBMegKbOyu5/5Kq+ZIccRy1WE+3s357YBkkKP46V
	tDhNeqLgRwGASFNke9p03fzXa8keD3E=
Message-ID: <b57b90a8-27e1-4290-889d-a05fba75f831@ixit.cz>
Date: Wed, 25 Nov 2026 17:08:49 +0100
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
From: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v3 4/5] drm/panel: lg-sw43408: keep VPNL paired with VDDI
 and reset deasserted
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-4-914b4a30b73e@ixit.cz>
 <sashiko-outbox-233481@kernel.org>
Content-Language: en-US, cs-CZ
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

Since I noticed you reviewing this series, I'm looking at the Sashiko right now, 
it's little bit harder to comprehend, but trying to figure out best solution.

 From the actual testing the configuration works well as is, but LLM offers some 
solutions which I'm not understanding fully yet:

  1. Track vddi via devm_regulator_register_notifier() + work_struct
  2. Add .complete callback
  3. it's harmless, ignore it.

 From my testing I don't see any problems, so I would love to easily say it's 
harmless (e.g. 3.), but I'll try to figure out if 1. or 2. would be more sense.

David
