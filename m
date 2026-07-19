Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0A1991CB
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 22:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784498535; cv=none; b=RFvoOOTR4HKL+ic1IUbPMIJsTdVY4jLrRN8YFSFvqf+CtBLIAFRf/TV0AHnbtqrcY2D4x0xdm6Q9a9fNYnAZmhNlChq9WL2/NVAJPUhf31UxkeEf2B9K7O6WGHw4QmyURg5KWS/F5rJlY8hKdK9+792wYTymlxVmwCBMITCve1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784498535; c=relaxed/simple;
	bh=67kSqJxBYeYORHm3dPY68gMhUJtatG/gvs2HaazGZ88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdK7f/7Wua8Y8Dcl2NCx1pDz77w5OUaF9w0MjBypXQ5NRZS28HaaVvtbBeNWXDFbQR3EUw4Gyl2mhDLRnRu/ihB+3rZPtbliNVwLMKrO2mpaFM9earmOedpM4UftTARLSi61jBLwPEx1/tntLfKB0mzDhHEjNVKLUghLEuTTkbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/mChse9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/mChse9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so47100225e9.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498532; x=1785103332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtzMPjTew5PFKy9cuAsUj9YRpPA5Fe9E0O8jZqCNoi0=;
        b=E/mChse9yRP9FAWMFSb6vzZwxAHKsYSKUuMOjj5NkVuayVSGLA9ETAfsCk06Moyavs
         fC/HSL+XL/XHcKakgYCdLXg6HmWeJxfSUsfDylqQ1vIKEXKUAv7EqqczXuNGC8SS6W/k
         x3sg3unHDayDuraJvwGjgz5Iu0pguqvTwFiCr/V+uIHj4O2lcYpyVyUAJ6pRdkYNJNK5
         1KYhXpoOPXOvM1mYYMjJJN+77u5Q9FrH2FYqOp5MyGtFZapWrRQdEoZqtv/nHrjygVXq
         xVOAtbRB3gbwtoadwyoVzncVwEWq69IViYgb0ke/gWongnaXATeNUMbfGu2Ts2RXPgy4
         OQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498532; x=1785103332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtzMPjTew5PFKy9cuAsUj9YRpPA5Fe9E0O8jZqCNoi0=;
        b=VjqYoKD1hiWvIJZahc73tZ9xZhlbMfUBksQ0oIPdPSh5Whb5vAsrWcFgsVfuowM37C
         7IOwfTSEH4EnmOnKKVtdnwzRD1vnPuBmcmxkD3/tT3wyBfizhe+75GO9oA9tfsGDsaB9
         UzOlRVv4YvzrvwOwL+pXk0X1TysGHSu48GolQdJBjNB7HGgElVfgM3FJ87Uz3dJIMtHc
         vwlJ7ZxXj1cKzz+nzbOlQ2lcVEJJBxSPdf7FjkrZcz9g3l8Y7h8ZFXiDhEIMPe5xVWfs
         GaDu3zIXoVd4BgqQikZZBt47+M2DV3aHQogKknChtyyS4POBFs/oqt8eT9A+B71yiwaS
         piBg==
X-Gm-Message-State: AOJu0YyZ94tsV7+DzDzNwkFYsnU8WdEH776CP70cJOrwx1XiEnlU6xra
	Z7IvRWc8YIy7yKBXJy6g7+wtzBTOtJv8FbFCndIYHvTXeQDDq80eE8z0Yn1FC906
X-Gm-Gg: AfdE7cmiVeEUlC8rBJZ5AaZYXSV7sc6Y+6DRQT4l7E1aaMi6JWaowDSmJDXgJv2IKsX
	gF5SmvNFr+5B8VTEPhUGpyhco2F9PgEHXmjeKq/fW0ebW1cyJAObDI/QYRy8AeI0LBfC7lKjIwW
	8ta0cQ17duqTEw51hJTlJxqMtyMTAtozesILmyq5+nIwfP9+LXuJP3KnAxfDF9E8Klw6g05ng6a
	7VRsKQrKDtkTQwjkoJpaS/fBBIywSR1yEppYXBLOUtlCSAWQ2hErWN+LxWDv6W51lpr8v1ZdarI
	yb0uj2TNDoZhq+wqAPCy9Mxv8MN02OdzdEggoYoTFP8ufCneubrUy3P0Nmw4FnzkX6JSf/M5ryy
	U4/1PuNOY8uNcURDeHDHPAPTufSZs4Ff0qSPsreOMdsBBftGu1yT/V6V0yOCATIYRnwLxr6BLOX
	pq3XcvCJE43A9hLY28ZYQXhQxmq6ptQ7m1YZpcIqpjMi3PRIiqZ2cHg8Ato1e8ZQEeSWlpjQXct
	l28rX5R8Z+Ntr3NcGONzzKMEFy12PMe3dx3Bi75b1gb9OGI6CSBv1mRZabK2H9GaxcT9AaEUIBr
	h5LYX1Xl
X-Received: by 2002:a05:600c:6a0b:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-4954a516453mr75828265e9.35.1784498531930;
        Sun, 19 Jul 2026 15:02:11 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm151510615e9.0.2026.07.19.15.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:02:11 -0700 (PDT)
Date: Mon, 20 Jul 2026 00:02:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH 4/4] serial: imx: clear imx_uart_ports[] entry on probe
 failure and removal
Message-ID: <al1CmLgNC4Tf5amR@gmail.com>
References: <20260719160812.35407-1-kmehltretter@gmail.com>
 <20260719160812.35407-5-kmehltretter@gmail.com>
 <20260719162850.043B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719162850.043B41F000E9@smtp.kernel.org>

On Sun, Jul 19, 2026 at 04:28:49PM +0100, sashiko-bot@kernel.org wrote:
> >  	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> > +	imx_uart_ports[line] = NULL;
> 
> [Severity: High]
> Does clearing imx_uart_ports[] after uart_remove_one_port() create a race
> condition with concurrent sibling probes?
> 

Yes, this is valid, but the underlying issue is not new.

Before this change, a dangling pointer remained in the table and could
be used by a later sibling probe.

This change narrows it to a window where a NULL-pointer dereference is
possible.

I'll send a v2 with a driver-wide mutex around the table updates and
port add/remove.

Thanks,
Karl
