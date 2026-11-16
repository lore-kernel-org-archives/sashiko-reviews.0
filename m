Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804867;
	b=RXKcebMtFPzSWF5+6/bQNwt3THTzWoTBQDG8Pir8oGnyFjGhtwwdQzE5FuQNAYp0xDmU
	 dfExoeqyRxiPxuSsl2H1qzd21EfXv+7B+U/bgyVmz5TZK6i5SN7ZSNxkjF79rJl+btJ9G
	 zuruQ8QdEz4WoRq/PndiQc0BfTGEnUTticW9EHvZTeWYUnSRI/vHwiZtoYd7GvdVdMrXj
	 yvwcRcg4WElKGJhD6OO6OEFdKyGnt1mrgmYK7NSLN1VlDsicHWLxxqzACuzvhd/DjQhYL
	 lLhimPvSyahazSNumkgRZgDkMOlmYh2WlMtyAnyAVCw22ia+taRgf+G1SGag2Pv3V1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
	b=4T5VtlpQpB+DVtxu7JjGoDOdhbeFJOQuMjDlllTTscAkWHDB028NfN4mEU4iYitW9aSL
	 vkLphMlU9JneX2PaTrYBaawwGvwiGR9tgGrPhV9pa0VT1ww22u0tY/FRtRiVi1cP5w7dt
	 nJJDFYDrskhMoFAh4m/WuavWwJocUMXj5ykGh+2YMA31hmcPti1ovpzkbNFUPGKvhyg0S
	 Zwr32X1KzDwbL/mQyFj1xsNoKy/tceTOh+mjzyZiGKk/J7O4UuyGsY2Il24lqrb0/Mtf0
	 jUDsttsg4wrEeALMAThX7w/sRqZ3qOuanmL7z49x46bKqrwJRNKgVA4qq+t1KoxFKRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmaFRZDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C7606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 04:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmaFRZDj
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so16184975ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 20:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804866; cv=none;
        d=google.com; s=arc-20260327;
        b=R1mbOoIFNBCyh+c2WlV1b2nzNAdd76Ada52d/PrCXfhvi9EpQyfkasr/eeeDYQDm2h
         kCBeERbs3B8d1Zm3i6uYgsmNuplgBSumu3RSNGn2Gbo48VzlaDfLryq9CKHkv6Q5whWo
         A7BVTKzUQTxJdNy9Ppfw512n/zHLX2139B6w8SZuebyo49s0h8AN1L236L2KlbmyvIp+
         egah4xM24noPLSOREyO7q6vJf2ImE8zUqTcQGOl/yQS5iiATcSgHgRvSDkfnNoCRX1rO
         W6ayuSyjUOjaGlxB8L9FmCrwRT+9jZMiMkgDoDOxc+YLUeyrP03PI9MBugopOKLx5A3q
         vvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=Qi0RO6YLBBsX8kUqWja5KJYlGrc/MH4sKsyGVzephz5T7ui/oH9N4za4q/Pq9t3SUs
         kMpIAhwsyllurpzFZcFL6SnF4wWn60mi5QCtWdFzkuP1PHoB0TKhdYTEildkU3NXyETo
         BfWsWYFK1cDiEkPJ1PkyRMOiNL9jr4jcK0twsNYuPCx4I/O26ueqIQggQO05bvkGJgXT
         j4i4cGFeTi1iUUB5MEyMOjSVMQeT9LCtU5ockh5o+UPGg4GMQY90cMq2lwULqqQ6Dw4P
         xe1QkqM0DuU0QGIzCoGRpMc0iUfuv5RcDHgzGxA5JxeuMrgvFXcgjzPVf7yAAZWUIRjl
         oPQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804866; x=1795409666; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
        b=ZmaFRZDjVvnM0DBtmwhtpdo3TQTeCEL5MTdYnfuZfsH8CbG1JBafygkFbcAATEX+B0
         WofIs2+7auhEGxj8hDvrZ6Bi9wYbxDTpvIX7OVb0l8s2YBXymCf0ACdwMUaXTYWOVxBO
         0cXc3uwkcfubN+iXVDaHr15xrH3md20Gb/zRVcLxBRW85GhIE7yvw2xaG7b0a1a60bdv
         QXMA/mZTZRYJoTQYuoKmNLQeQObABHRvermpnmh2gI3BQQm34Neo6Lq/WFaLa0EkklgD
         WhbcmWOoaMWy2TyTa1mJ1SSfOy2BuoB2tZWrmiCyocMgKXZgKv00d5r6NHp5MkYcU0VE
         tdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804866; x=1795409666;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0j3XChK2x67wNf1p9ICYbQQbtwgRuRXvhZomNQ4ZuE=;
        b=xjkRZb51mX3K4Aqoe+tH2YUjpTA8Q/H2F7hIYQpitx1H0zor0hDNTHh66WS6k9p28a
         JcfLYfwI15JTID8XL1S/UNGoVYyqfktcY8iBZ1l22plY9kOteyEKr5RH8f5Ky8QVtIUa
         ZlWJMWWftcRbgstO0R/3FNg4mNH45LaY3UZrlbLr1VdfrAlrx8BH1kGI3N0QQSLJHLE7
         abL/0zyeEKM5c/3rXZtBCyHfP4kyN51iP+BW4uUuBGmczwLvJeqjY9Ztpnf0PoaJ7+C5
         rXqOKGeagyAZ0mdqN+vB54r+ojLaB03HkWywhPbZfABtce4G7BCo0pDRzRPXb6rXr1XO
         2cdg==
X-Gm-Message-State: APuU4Z8dk9KTti5mVKpqeLphhJHjXw+16LpSGLWKP+QJZzX5qdFiG8Xl
	Dw3JwBbPml9hgwDOaoLEOnKIpWDYoHNe8if40zAbwi1iUVvRNY0RYnPE6kPS/tOQOLlp8BcP/g0
	EYi1jnMD/5rcW3iMcnzggGa2EmamiV00E9U5x
X-Gm-Gg: AYBFou3xdzjiW+L0ubWXOh1IbD8DDt0tuyxzd5mbjKQleqMDChyUDCsq/MhvLd1RKvE
	gO7hbYK8q4unuahQqYF0YM9diaM2GdTQbyOPl/LxNIJ69TTWPqAxJQqoDde5iYXBRZ/ysMKTvRx
	9yQuXnyvYV4V1h7hezFLEq6ID50+CQ44zztJ4LVIb1STNUDKZJCJAysUXtNf3TL2ZrdYOu+ftPL
	fRy8RnVYp457Z2hvUXuHN9v7NS41KDx6+aFLT/rr+SiQt4OhND4xRrVSUaMcUa2aKUihhaS7BDS
	+7/4g1G5gCx8wLm14QuaWVVxImSn6E5/tWwbJ9JCRGXx/P5RJEToYrU1yaj7sLWL+194AJ82Wh7
	5rBKczz4Mi8n/eQ5m4qGAzMMfIvyezQ6Qi/h166ZHdpOQWFNHJNQ+g9DXPbdMHkmCWVYtEdE28C
	uJCKnOYa5xV3eDvL9yXFRUEGzP549RT2ZrReYDDeeHJ67UNUEO
X-Received: by 2002:a17:903:182:b0:2ed:e93:71af with SMTP id
 d9443c01a7336-2ee0dc308c5mr101471725ad.41.1794804865920; Sun, 15 Nov 2026
 20:54:25 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
 <20261116042633.497423-3-phucduc.bui@gmail.com> <sashiko-outbox-216193@kernel.org>
In-Reply-To: <sashiko-outbox-216193@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 16 Nov 2026 11:54:14 +0700
X-Gm-Features: AclHuK9Cy-2xJIyp4OLrZQesV79-D3SbAIhTqG24cmDidqGr84da0Aoekbfu43Q
Message-ID: <CAABR9nGkWHy_YEoEa0H+KL3_TGEeco9hnLVvddkw8Y5tNWet2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: atmel-classd: Enable pclk during probe
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Commit 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component") merged
> the codec and CPU DAI callbacks, dropping clk_disable_unprepare(dd->pclk)
> from atmel_classd_cpu_dai_shutdown() while leaving clk_prepare_enable(dd->pclk)
> in atmel_classd_cpu_dai_startup().  Should this include a Fixes tag?
>
>   Fixes: 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component")
>
I agree that a Fixes tag would be appropriate here.
However, I'll leave it to the maintainer to decide whether to include it,
as I'd prefer to avoid another revision just for this.
