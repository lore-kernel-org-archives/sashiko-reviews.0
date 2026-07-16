Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5457409132
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197866; cv=none; b=raLQ+nao06RYcceKySssbIQCtOim3Io8h3oWjnpHD7sWMY8jJ2Uv5DGKOoiL5VGInMD0ZNWISF3tG/KGg24B0Z3jXDCQNtniAsbAtaK2ofujNOqwMRtm9qOyuh80j8/A5V6t8Q6Gqv4KeSwIJJkIjy0P4mtxO1viuCJGi+CXw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197866; c=relaxed/simple;
	bh=5ubhc7oClAf6zMYdqg4KC6FNbNoCdaI7cvBU8O72Ex0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHVV93y/IyB+bc1Gh5jV5Sv1RTUUkZCEQNWxEdJY60PLWjzAoypoO+F5s1UEp3NJyLVcegsRZmulo8ch6jZ5tumlkgt/xLZn0tHFHSFW46D3SF8Bh3rQ1c1pzqwHSTriCCn5U88MgAS56SPQUF2wrngvkEhiZp9JgRKkPMjkPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=p30pqEZf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="p30pqEZf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so43985635e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784197860; x=1784802660; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxOFIC/lNwrjJrULah4xZJOM7YaGDvKvmR6DqO/DU8Q=;
        b=p30pqEZf9H6c4g/JMGvEGxWf9bSpJ/6amR/jewNz+xToeQ2aZ6fHd1TiWmGC80A5mj
         gF8VXjT5VoJL85G4e8TvHvS5qOZgCg1unq7gy60WCz782Azvm0tT/mFhG2T0jSA9+Ml8
         2ylAUkyHqzLJ0z0c9Y13OQqRgVxlZdDHqUrMLNYyNC/ie6/i352XLkESzhrdkRRLEzO3
         jFZ3NP06lYryJznVGjAQi3vu+PSxdKUS/jnDXT/B5WP4e8pYIzLx/fQOyEbJzdo5BA3i
         KY/bG1GpjgGa+rqFXJ8zLeYPqwm1ud4XwfOlBRJty/R/QXAh6fiE8TPXEk2UmU0eo/dy
         VZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197860; x=1784802660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KxOFIC/lNwrjJrULah4xZJOM7YaGDvKvmR6DqO/DU8Q=;
        b=sNCrjDBSbUK0tzjCB/pAbaODsUwuY7/h7tCWqsmkvownWOaRLCeFBoYch+9nB5zNkw
         RVGvbVNlEd2kxkWvEAX/+J2otr7kodTA12gTbbGLbi6HfHYr3Iq82iQf96Q4iTjRTY4M
         fGCVwaVN7ITy4LThSLSbjKj9bvNbp/mt2B5lndG6otWvJJLZ0ie8MFidT23Ggkum0sJM
         q5paOFtJ3aAxMOTv9Oio+vvqBirwU1qYPM9VIYpzTdioQzI6LPa7bblGzibNtoqpx92u
         de1yFUi3G8R03AWeAExqlqIFfsZszmWPx2JiPitXPu9w1uw+q7Njw47kDwFbzYBwLUvh
         UkHg==
X-Gm-Message-State: AOJu0Yylsj90HwSqjofDO0rJJ9TxZy9gdXH5jZwOxmcU761xISjaZrc9
	gI+zzGGfKyoMZKS9xalUX6MUZ/9hy9Qv6IN2tP8OvC05F3iAPoj+oeka/gbDhSHLticck3vlptl
	uyKTX
X-Gm-Gg: AfdE7cmrDwAEeiLNOyQznLDE8Q52VYN94tVIGVdzRbBk1ikEZ1Xv9CrYlrBBIXTmXLj
	rRMqJVqNjaBlPGyLK0cTqVxcBleG1vyH1CtQHWS52KdfUwOn/toj0MK3rIxUzjfekowwKbKdKme
	1e37AP2MW7uGDiwInJc09Vcu/ruVZQvxzg0vrSuszjrwZm6qcJAst97uFEm+B6tHCckGttcu63Y
	NXWePbXULPQSJdGgJjgDrbbm6B00EWfRXsp6o9XZfriigAZiOear+ijvxbohVjzokJuK765sdp7
	ppssyeh7vVcnuR2PaAm+y4i6jpjD95vdobaFw+uffcXcGMaB8FlrKwiVIOaGFnRPz8/v0fmyjIF
	2AWfPx2x1F8kRZczD0Aj6ms7+6bRQvP7G1g15ZfYdHXDG0MmubVW21QXIZyEJX9RXjfs12JCK6i
	ZpsLLh+4owO4GSNMGss2ffQA==
X-Received: by 2002:a05:600c:e548:10b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-495389957a1mr81189495e9.10.1784197859472;
        Thu, 16 Jul 2026 03:30:59 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c599049sm94687865e9.0.2026.07.16.03.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:30:58 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:30:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, linux-s390@vger.kernel.org, 
	tj@kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rdma-next v2 14/14] RDMA/selftests: Add rxe_netns_names
 test
Message-ID: <aliywIUtRHBCv5Rp@FV6GYCPJ69>
References: <20260714142927.1298897-1-jiri@resnulli.us>
 <20260714142927.1298897-15-jiri@resnulli.us>
 <20260715143046.020451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715143046.020451F00A3D@smtp.kernel.org>

Wed, Jul 15, 2026 at 04:30:45PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>- [Medium] Asynchronous RXE device deletion causes race conditions and test failures.
>- [Medium] Asynchronous network namespace deletion causes test teardown to permanently leak the exclusive netns mode.
>--
>
>--- Patch [14]: [PATCH rdma-next v2 14/14] RDMA/selftests: Add rxe_netns_names test ---
>commit dcc30384e696a4047f319e3b7139b30b3ddc09f4
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/selftests: Add rxe_netns_names test
>
>Add a kselftest script that exercises per-netns RDMA device naming
>with RXE. Cover duplicate names across namespaces, move conflict
>handling, move-with-rename, and same-namespace rename requests.
>
>> diff --git a/tools/testing/selftests/rdma/rxe_netns_names.sh b/tools/testing/selftests/rdma/rxe_netns_names.sh
>> new file mode 100755
>> --- /dev/null
>> +++ b/tools/testing/selftests/rdma/rxe_netns_names.sh
>
>[ ... ]
>
>> +cleanup_devs()
>> +{
>> +	ip link del "$DUMMY_A" 2>/dev/null
>> +	ip link del "$DUMMY_B" 2>/dev/null
>> +}
>
>[Severity: Medium]
>Will this cause race conditions between test iterations?
>
>The ip link del command returns as soon as the netdev reference is dropped,
>but the rdma_rxe driver handles the NETDEV_UNREGISTER event by scheduling an
>asynchronous unregistration of the RDMA device via
>ib_unregister_device_queued().
>
>Could the next test iteration fail with -EEXIST when attempting to create or
>rename a device to the exact same name (like $RXE_SAME) if the asynchronous
>device_del() from the previous test hasn't finished?

will be fixed in v3

>
>[ ... ]
>
>> +cleanup()
>> +{
>> +	cleanup_devs
>> +
>> +	ip netns del "$NS1" 2>/dev/null
>> +	ip netns del "$NS2" 2>/dev/null
>> +
>> +	if [ "$MODE_CHANGED" -eq 1 ]; then
>> +		rdma system set netns "$OLD_MODE" 2>/dev/null
>> +	fi
>
>[Severity: Medium]
>Does this cleanup sequence permanently leak the exclusive netns mode?
>
>The ip netns del command initiates asynchronous teardown by queuing
>net_cleanup_work. If rdma system set netns "$OLD_MODE" is executed
>immediately afterwards while the namespaces are still in the process of being
>destroyed, the kernel might reject the mode change with -EBUSY.
>
>Since the script redirects errors to /dev/null, it seems the system's RDMA
>subsystem could permanently be left in exclusive mode instead of being
>restored to its original shared mode.

will be fixed in v3

>
>> +
>> +	for m in "${MODS[@]}"; do
>> +		modprobe -r "$m" 2>/dev/null
>> +	done
>> +}
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260714142927.1298897-1-jiri@resnulli.us?part=14
