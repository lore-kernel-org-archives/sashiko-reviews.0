Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC685367F2F
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619433; cv=none; b=NmldQ48s01XTOpIGp3BTgmvFfxb9y0xID3hRuIgHK/7jeFOf8MB17zR5udDlJDa9EjLPFa0lXQQEVSeWZnk0N0dL++Ew5hhdMYtDxztKE7/T45xeG9BhBobQhR/LugdFVT8P6NKbh8gMzbv5IgIwSW2RJbuG15R+WVlmmW4bgVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619433; c=relaxed/simple;
	bh=LBceeQL6zeowdtsbVWYN2KERwU9s973+eLElj1dczx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miX3LXEN7r4TOXACjSN2kCGvdpqpuF08uZ8whc49Trx0VwLLNtIUTEfaWIPxBBmdQPTU1BFwqlRrOtE3Hs03WQWw5VgCvlE1sS5t0ALXfpQQjx4kkY+BrudgS+SwExNuvGc+G2FOnRPTyyv0ZQje1eGqGrq0NO9gnMS41i42FjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwUnNarE; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwUnNarE"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso2087010f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 11:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790619430; x=1791224230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBceeQL6zeowdtsbVWYN2KERwU9s973+eLElj1dczx4=;
        b=EwUnNarEdyPebMrpJ4BufnraRiWNXxVUGwvtQjRfpx72GJi49VrSF4znKer1XTvP+z
         PVpBUG7DLdatgoGpWlF9peOuNMArGeSkkp5zLGKOiGCB9O8Ws2JSKOfbvBBaiwElKWZx
         6OMv6TAv355n/2J+uF1BwlwrF0LoXm3qzgUbV8CDjmp93TD2JhPUrrsHIt56bJsacySo
         54wRuwqNzZ14kAqrQSPrvJHPKlOjEmQ5R666+N/l6CnmdSK2AtCI1phrUuFM11m5o4AF
         FvhK8JRcA2zKL9+e3PYU9hTLk1+B28uscJJvGK+rIQhNR75OiqVnC67olPdAEjF+0eY2
         Z4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619430; x=1791224230;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBceeQL6zeowdtsbVWYN2KERwU9s973+eLElj1dczx4=;
        b=Lxx9aVnUYjIoD0AtyxpgyuzI4988F5OgJMsarhDKA0o+sWDvT8lyiwpRIPfRTmZ5ES
         V23uZFtYe7JBM13PhqLNcucoxFq6louRM5mODiv0D9JHVn3pRBc3CUn4IyLDi8W4zMyu
         WD+C32mK0Jg8HuCEpuIlvl9FwKjLd96WklxqxNQXF9cclJgN/uYPClRjL/vAGZrAhBlX
         z+t+/oj6H9/ybCMZHSeUeZZq8yxqFYCZKpO4mxrubLTPUfs7aqC+J3vNy7JoetI0HvMP
         bpnN6gYJ/xzi65dH4Ysi5G9pbKWmjwF+vFVARPbclqe4GryItgZMTw7RV5PbWb7raL4s
         WNEg==
X-Forwarded-Encrypted: i=1; AKwUvBx3twPY3Wfiq76tD9+ghohYibqMd9LALqjdUHTAj/uvxvE5c//9AkRCxEwZlLNXcIWb7HwO055y4lLk4O+LJQ8=@lists.linux.dev
X-Gm-Message-State: AFq9FYINR9Y8HBTxEQg46b7jdFyS8mN8mWcgtP0Y0e7Zm879g8gun1NZ
	Owd57XqX3MUfKQ1ZI40HbGPSG0a276p01dMG3Wu/rzLOrgc48RulS3c=
X-Gm-Gg: AYBFou1EeaoD0rPcgpvs4qGZILijXM1irsyAN5zH5FAxpfghUWyYDPGTgKp/BdlLnvz
	kOkS7Y1aoNJKj/e6AwknbRfGzA21Zc050UpCtZ4dX6crN020pIv3eoca+S0kSwqA2nB6MLt81jY
	47TK2mLeYFtXCDzV4xpZ2D7FqXwJHPmoyuw0wYJKoxSWKpiQ9tYVd+lm8PFivrmC+O9QN8Dq2mO
	VlhRNeRRKGIOa/QgOeqyFKutFh7nsCZF3CrOx2htDszXGN9BLLvIIFelGtM50DF9GgstQ/78Ca2
	sBHK3ZHnOn2hv3HxLsWCOU7FKtbV6ZtGxVVJkuEInHYYvmWrpIM1dpEQzsrDTjB+uCj9wPaJZa6
	CztJTfxLDbzceQbotODcIPbswO9nM4HGi12Sd6VRgqVIQTTuOyQHFUI3UgnBBb0jd02ZLIJDmku
	UKns7JUCAndFgyx4n9/Cfc6qeEUiUMNiD8+BYOl04QolaQEeLxUIEcZdbhqU4PZGyPnQfpZQuE0
	vo18o3mFNfSPD0RfgsmaVhC2Q8RucnUi+RyrJzPE2NCOHu8ceTbSFQ6dN8=
X-Received: by 2002:a05:6000:27d5:b0:488:8525:4985 with SMTP id ffacd0b85a97d-48885254b3emr10941836f8f.24.1790619429708;
        Mon, 28 Sep 2026 11:17:09 -0700 (PDT)
Received: from localhost.localdomain ([31.223.84.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm29540093f8f.27.2026.09.28.11.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:17:09 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: sashiko-bot@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] Input: fix potential use-after-free in input_devices_seq_show
Date: Mon, 28 Sep 2026 21:15:24 +0300
Message-ID: <20260928181704.61015-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928172128.D6AB41F000FF@smtp.kernel.org>
References: <20260928172128.D6AB41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch is withdrawn.

Sashiko's assessment is correct. input_mutex already protects the device
during seq_file iteration, so the explicit refcounting is unnecessary.
Additionally, the patch had two bugs: a refcount imbalance in next() and
a missing IS_ERR() check in stop(), which could lead to a kernel panic
or use-after-free.

I will investigate the actual root cause further.

Regards,
Türker
