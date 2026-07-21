Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85281E0E14
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602291; cv=none; b=GWM0r1rTe/tfbR4BpdhftvfVuc7CQLv6KWKLOBiYLfsk65noRJF6zrPDY0z+fl4Zu9Qf+l/IBx/oYXqoJksJQOB5Thjo7kY049khegxLtg/aUBmFA3z4d7GgbrR185UvRcIyAV5zA8+XFlp99uT3LTQDPdy4IcBteiXeJt25cLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602291; c=relaxed/simple;
	bh=VNCw+OPS+9XKvojE6cjZmJTeLE74bQ1zPYVNuy3QVNI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iQOJo4T/Ju2kGHf+gjCnygt53t73+56cjNyWHIWQ/26LxDvGiK1hl8xlrhMXT7ioFOAygRMpstbSn6iT2PxBJjpMqGNJSKB8RgXro3pek+07fSxFhBHd+c6dHNBCGiLXV6PaEi8Yhy2Ff6ucwmjL5V6DJLdFREZPAb7QVJnPjHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=c/bxZelp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="c/bxZelp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacb8416a1so73536625ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 19:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602289; x=1785207089; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RK2XWhpgkuD3mDlpcyJp3lsyxd159i4dLgMJyn8OfxA=;
        b=c/bxZelpEhri3aNRnmfETAvW8z03AgtsLi6Qq7Gj08Ddd2DK3kAw++2KIeZNYnUxks
         qoS2j7m4h/GtfInjnO72qX9mdu8v+pzdNyocjMTRrNnWAAMJVYgf5E6taHHcEjPROTHD
         HspjcrfmSO5LxxbY56swe0j0ca58EHvf3rBxnC/oYmqR97Rza+GFtaIEITx+fh9Xc0Q+
         Kb31Ci/CTRBKLjJE587hB1hXfLNCtPIf/ZhnUfYe24z74XE4wxypK7vp3AGCR6EwUbmL
         kKYsU7JaFLMTOEvpqdSZ4BhvOuKryeiKiYc7ZMiW6XqJ90n7Z5k62kVgQ9tVQuuWRrhY
         Kp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602289; x=1785207089;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK2XWhpgkuD3mDlpcyJp3lsyxd159i4dLgMJyn8OfxA=;
        b=YPr6oNVDlNfGuwZgDlyK9ZySc01auOWFyduLIKVPKoTMoMU4uPid3ETLtmIl2MOzrC
         9WAU/1rrafhNzI/fG3e8DBawvkOYAYr5gOS2WEFvE+Dvb2HXXcGQxXQxHOkkohXIrrWs
         VP8AruvKPMypixF/O6scocdrWE6IE6WbfAsuWlex2AEqHI4WCZobj7UPRr/Zbg0/Rtlh
         wGGcj83Us8TsJU8ERS/Z/nsg8vrYFRGaSYqlEqlXgbsVVG+UgB42S+B6FYwmRbMX6V7N
         qri8MTIV2Fpe4kO1aUbA57AOY+X2TMU1ShkiPQWntXkAY7R4ixd0fjGxspi8PbgpwFLE
         NnLQ==
X-Gm-Message-State: AOJu0YxLCmz5EA2WCRhyNGRLC1KAenaerEbZlweEGyNR/g4Nk67kd4al
	Q9zOXwmtqtPzn6ab3n+DPRqsOfRhb54t3SHUXATakNCswW01CEHtgU8lVZA+LSqUEf0D8pLPwgm
	yrbqJXNE=
X-Gm-Gg: AfdE7ckN4FiHPpyPfzlaCU4MTFJfYPe520QD2lfPWn6/JMsLfATcuWnI+I6V6s7RmxP
	pwWM2FcXN7wac5u9xOzjY0Jzfo5xjP5OAza6BT+3I0bkGS5A0d2/HXYqWdMtd01y6ijt7jP8LER
	92+7XVPrn0HqdU4aozWU/yAVLY756mTTCLFQgEfr3QPRBTZlS21m44Olm2YrzoHPewk+1lvFTY1
	a97RHxXpx/oGCvNzOiLBOPToLMPUXi+Wyp+GELxTmu8e5uXCa+DbEgpfP6FRZZ0OsmVMTgndzf+
	s8OLRS3fPCNjqLLovMJvGGtWggYIRYjPYF0xw+ox4ihXFZELvWO1cBK8Ih6+5XKQsWloBl07OLH
	lu3SNfEQRlMzzyfDmeJd8qnUHAhxNAgNRa3XDOgVghhDXwGT0KMSlWPa6ZkzKv9LHvZ5rtHBkVz
	rG09SqEtze+/v1
X-Received: by 2002:a05:6a21:7008:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3c3ad7a4389mr18875839637.26.1784602288806;
        Mon, 20 Jul 2026 19:51:28 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm44845282eec.29.2026.07.20.19.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 19:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 19:51:27 -0700
Message-Id: <DK3WPOXC9I5R.I4ROFVRBH4K3@nexthop.ai>
Cc: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values to
 live-tree paths
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-3-f1e5d9889b30@nexthop.ai>
 <20260720072014.E40481F000E9@smtp.kernel.org>
In-Reply-To: <20260720072014.E40481F000E9@smtp.kernel.org>

On Mon Jul 20, 2026 at 12:20 AM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Fallback to `__of_prop_dup()` for `/aliases` masks ENOMEM errors=
 and bypasses null-termination safety checks, causing silent corruption and=
 potential OOB reads.
>
> Pre-existing issues:
> - [Critical] Dangling pointer in target->np->deadprops leads to use-after=
-free and double-free if of_changeset_add_property() fails.
> --
>
> --- Patch [3]: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values t=
o live-tree paths ---
> commit 8741f5ffd2983da599c7be77cbf8c1af8325d4be
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of/overlay: rewrite /aliases path values to live-tree paths
>
> /aliases entries added by an overlay reference labeled nodes inside
> the overlay via '&label' in the .dtso. dtc renders those references
> as string paths at compile time, but the paths encode the overlay's
> internal fragment layout (e.g. "/fragment@1/__overlay__/fpga@0/i2c@40000"=
)
> rather than the location where the node will live after apply.
>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 654a70d5cb075..338786cef17ab 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -350,6 +350,19 @@ static int add_changeset_property(struct overlay_ch=
angeset *ovcs,
>>  		if (prop)
>>  			return -EINVAL;
>>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
>> +	} else if (target->np->parent &&
>> +		   of_node_is_root(target->np->parent) &&
>> +		   of_node_name_eq(target->np, "aliases")) {
>> +		/*
>> +		 * /aliases property values are string paths in the same
>> +		 * "/fragment@N/__overlay__/..." form as /__symbols__.
>> +		 * Rewrite them to live-tree paths so of_alias_get_id() can
>> +		 * resolve them; fall back to a raw dup for non-fragment
>> +		 * values (e.g. legacy string aliases like "ttyS0").
>> +		 */
>> +		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
>> +		if (!new_prop)
>> +			new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>
> [Severity: High]
> If dup_and_fixup_symbol_prop() fails because the string is not
> null-terminated, does this fallback to __of_prop_dup() end up copying the
> malformed string?
>
> Because dup_and_fixup_symbol_prop() can return NULL for both memory
> allocation failures and structural errors like non-null-terminated string=
s,
> falling back to a raw duplicate here preserves the non-null-terminated
> string.
>
> Later, the reconfig notifier can trigger of_alias_create() which attempts=
 to
> read the property:
>
> drivers/of/base.c:of_alias_create() {
>     ...
> 	if (owned)
> 		np =3D of_find_node_by_path(pp->value);
>     ...
> }
>
> Could this lead to an out-of-bounds read when of_find_node_by_path() trea=
ts
> the non-null-terminated property value as a C string?
>
> Additionally, does this mask memory allocation failures from
> dup_and_fixup_symbol_prop() by falling back to a raw duplicate, injecting
> unresolved paths directly into the live tree instead of failing the overl=
ay
> application?
>
>>  	} else {
>>  		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>>  	}
>
> [Severity: Critical]
> This is a pre-existing issue, but while reviewing add_changeset_property(=
), I
> noticed a problem further down in the same function.
>
> When a property is added to a newly created node, it is linked into the
> node's deadprops list before the changeset operation:
>
> drivers/of/overlay.c:add_changeset_property() {
>     ...
> 	if (!prop) {
> 		if (!target->in_livetree) {
> 			new_prop->next =3D target->np->deadprops;
> 			target->np->deadprops =3D new_prop;
> 		}
> 		ret =3D of_changeset_add_property(&ovcs->cset, target->np,
> 						new_prop);
>     ...
> 	if (ret)
> 		__of_prop_free(new_prop);
> 	return ret;
> }
>
> If of_changeset_add_property() fails, perhaps due to an allocation error,
> __of_prop_free() is called on new_prop, but new_prop is not unlinked from
> target->np->deadprops.
>
> Will this leave a dangling pointer in the deadprops list, causing a doubl=
e
> free later when the changeset is aborted and of_node_release() calls
> property_list_free() on node->deadprops?

Will address in v2
