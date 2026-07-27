Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B61A8F97
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131607; cv=none; b=N5zD5sG2g97l3gNOAaIQPg0Wg9QFUx5A/K84GutBjsYtG488hs5RQ3arxR7pw0ZA4EIqFamawevP5z5iqyryED0GgJ2Gv7+5YMeCYyBAUf/SqJsPae0rJgNe7X6tOdxXdb3ikHbdOhlJJB0Y6Z6nh3JVyyssMO6foqqrqvOPuek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131607; c=relaxed/simple;
	bh=3GPnECwUini/fW6UPtLPQ73isYYZIZv5Vl224arhez8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uReC2uw7DkgD/RUHSYzYvPQZI6iGKZcVzwaQl+sN0HgIm8edAG3WDSLZkv2jm5ExNe2k/GMBGNFL1KTVkch6uWkbHJot5h1f8+4f++G896cjRONJ8fr0Jvvrh2Pib/lpIXVXZYa/iY5Fc5o/dand4sfzdN6lLnDQAI+p67BOhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPyAYpcA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPyAYpcA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so22970385ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785131605; x=1785736405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GtILubvuVEhDDQkeVMqZri30kt9R/z63vZzws5i+nR4=;
        b=mPyAYpcAwDBQ05GFbvPIE+KUcpBebdJb0u50NFJrKE9eVqIOYXiuCYAQG9XFnLiNxY
         lYbN3ys95+JEdIg30nDEqNfqH9/LrxUbG6C2U7/p/fNCxSwG9kQBBOoj3dBTVHAmuYsl
         AJyx3VmXWprK0RrGYKdIZzBgJtoVdDvFAgphVwhU7qyR7aHAwqEfxWFykBhPOoicVwXW
         c921ILEUXx9hKwzdd3YzwJ+ZavnetpiZcEuHy5nrFTuUvREWLynGV43mrR75G2zJ+DXk
         ven4AH2vJFo0qfZ5BGFJbzS7bvO2Hk0htsfAcd8I0U86RFtppOcifpjD1eRxCfI/xwv7
         ZLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131605; x=1785736405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtILubvuVEhDDQkeVMqZri30kt9R/z63vZzws5i+nR4=;
        b=OEIBSKNk6GgbB4W2jgoUeGk2smKrY5NckSEylWD3ykYBmp/b8MqDGv1pUf8y3KGCIL
         QD4IB+r/G6UJ1IykNrb3cREqDEw1hJnQhUyiwNkdqlW1ty8XWx6rzEx0WIJ0/IWvwuiI
         aC0fhIML8CCAnbv0wrrxv4szkZw+S5Wm/W0E5Gg4aDzHKrO/GlMwS4eNQc0LA173yuwv
         mR7xPYx1n69N5xHSkZRx4HGjhjA6AZgRdMN7spMalF6OXDMk92D08ZPL8OKsCa7APOGj
         mzTsruE8UocZJG5L7nP4ESW1dI8nFH39JxPvozJqIr6K5W5o8lP9vS5U9ztikMaxjqkQ
         NK8Q==
X-Gm-Message-State: AOJu0YzTAFm7vAKR3Kos0dAdq/DvK8VtSEsdtxewODcmdpWQH2wZHZjY
	AtEOa75Wf3e7umso0uHUY8jic8rfLeKvrnQ8Xl2YA4VyNE4qwuj6rr5XDlms2A==
X-Gm-Gg: AR+sD13quZruSoBhOEXoDetBSOEMqzrKGrvE3DyLt01xK4T4fqIld29LHlC447Hjopx
	39xj05RfQ5uRhQ3hu1ip8RpXwvRi6rrRZZCP+W92CP8eoM3m1023uHzN3tqGOA/oZBqYtbpRZIA
	9vTd7t1p/yjkCxabKM55diKThBeyiRSV5LWBGo8DBRPRhSvrDfE63VHbRW247NfSIRoiOVikbhT
	beUKRsIPmY4a0XYmPcuR4BUQSKPD1bsq5y4aV9mOQJnVtE5B9CSar14vo2wDzeFTrPpu5WL70Qt
	ZD2YZFPhpIl2HRG4QKq6BvLJmUh8jTO4wLt9kycKPrjGxcxiVK0jMIwuS2cdFyk3Vp52d7F3gQk
	ogHVv2JivwD+xGGNadQEkCg9PyEvhkqubZCKzkI8XLC/GF3sLKnmE8ute9mDsNK47UCffvhBfng
	ncj7mVUnjediFfou2ioZQPg3I7+J4b+ABxEASSbt2gqWI=
X-Received: by 2002:a05:6a20:d4c:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c67ddebb22mr6626802637.37.1785131605311;
        Sun, 26 Jul 2026 22:53:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:fc2f:1878:e714:ef41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm44638825eec.2.2026.07.26.22.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:53:21 -0700 (PDT)
Date: Sun, 26 Jul 2026 22:53:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: psmouse - fix use-after-free during protocol
 disconnect
Message-ID: <ambyOdepIOfn9KHH@google.com>
References: <20260727050803.1269941-1-dmitry.torokhov@gmail.com>
 <20260727053809.030801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727053809.030801F000E9@smtp.kernel.org>

On Mon, Jul 27, 2026 at 05:38:08AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch introduces an unbounded increment of `psmouse->pktcnt` leading to a heap buffer overflow in the `psmouse->packet` array when stray bytes are received during protocol disconnect.
> --

Fair, I'll fix this up.

Thanks.

-- 
Dmitry
