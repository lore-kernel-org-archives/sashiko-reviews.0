Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887676;
	b=X6piYKLXTT+lQloLf+QwF3FZ0JlqH/V/Hgdyqv0GrOUj1DGK8GaANgg5HhlYBMDnE1UW
	 OoHvNo4zA2c4XHKkSzLiNGM+jd/ZB3TpQ1hvdx2B+8YNEpuQoaMQZQV0hPnGOF9Ly+6pP
	 8yjj6RnI6MAkFLJwUBqSUXFOblbBG4DZJKHhDE2hePGQXnTZj4NVLrGj+mlmrhwj0Z0b7
	 JXdS7CKOBAWaowtgSDYgvtdkXqAuQzLUhN/I8tnnx+MXKL7+KBol3DYoLtezQ4HymBdvO
	 9JjmJz6Du3X3f/XXHhbqqaIkp9Rm8uYTjdIrBATII/gnoqvnpV6sQDCU5c3JQdp/ffw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
	b=QkCBtG9fw9K8HSNq6cxkkzE63DqWTpiayydumaKG3BYpRPPM3lkG1vWpeOhfAoSvVYGy
	 SZnAep0Ko+C1Lt7V7fOeRf8RP4j5tiTEKTvaCX79zlBD+i3ir9w/Eg1pMyaJthCOD5P9W
	 dPojDekpJcs2aYsHg+51bBFrLzFLhbYH20gZhDP81NulDLtD3Ftzf5ung13CdIQlv++zW
	 HmDQ0jD7WPMf7QIvn653MEDQ85LJWTdCLGo+dqqvkC0Gl9Fvv0gcWbXifLXlpNj/XM+NH
	 1EHFYZWvGU2AzLRqPU93CgwAezlIYtstp010RY3U76M00vSXc0hBiKh/jQPhlnUZlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WRBC4RqD;
	arc=none smtp.remote-ip=74.125.227.199
Received: from mail-pi2-f7.google.com (mail-pi2-f7.google.com [74.125.227.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D49606A329
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 03:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WRBC4RqD
Received: by mail-pi2-f7.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso1026426a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 19:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887675; x=1795492475; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
        b=WRBC4RqDfnYD5tK2FiQPOrzGPCLewdTfXiYnHLssCiVC/SADZakFd00H+hkeVL8bD1
         H9bWdHteryXdJESZ7b7di2rM/A1chkIaG0XB8fGU8Fx9tkPrtBJqJok5ChhT5Wwxegfd
         xfHoysS20DzP/B1ASLl3o4X08zVUU2EBcNprfBH58ARog8Ud2uvf7wBgdJdsmS8nL936
         6urDBBsawTTSclwP6YISodpkayX07cixDYMxHOsCM5GTD+Mj2+1/6iKhAJNO68mwGGuH
         I51VYMsfD6FwUaD/B9CQk8Aezyn8cksXGcnveOYWyIcn66pfVSIDVfO/Yl9QMWAB7S8a
         KeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887675; x=1795492475;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
        b=ZKOD+WJooiSvUXczpVIz7TfcZnMvlosepn8JxJKvCiwENHwGxm3yt2CeCwHA13/VHV
         sbTfFMYAjuGNmwUf7PH1L8o0/nL/ZL+xvdYRei02I0cJdumjyKabz9JxRYQbBiKGHRVH
         SfK0k3pyxW7WuXRyUDJR4m8lBB+dLgEspcAMqZG/uPygD/ZSwrJo2Z2Af68Tba0O9oUT
         8xTk7WzxD5gQSD4VL9dImvVqmeEt/LtstgDJ2Xu8W4Cnzfv6ncbSWGpe50zQ90vn8ftp
         gSpp8fv5qnpTX075LhyGNZY/AtEP5H5XNMSPbqYvyQOGpxUVLBxIIQLpt+Srx9kYx2H3
         xvqQ==
X-Forwarded-Encrypted: i=1; AL+hErHHmHIEvI80N3CyK6GlYYTI1nMi0f+5UI4Fa9VdztQlp+YLDqKxLPnTbAMWSfzsH/oqbW4sZpKDgHZ2bd7n5cg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8bSu03oddSFaiYPZkTuUTWNJG3XwRGqV6NT5SiIPPqPnCuXOnr
	n4S+Pg6hWdhFcGkEbsR33WQ9HfqYrAPhmSjGUj7xS1+BgJG+6M+kc2Sw
X-Gm-Gg: AYBFou0wYI+5HamsvlIGEzoNhnmFrgpv3k/ZQCchxfHymQi7CBAylgYSOObJia+SX95
	XTXvxcE8SDik3CuTJ1zLcYkPzUKKxPCvwiPB38en/eVxGrUKs1flO6PPp1qiIokN/IHH91F0mDf
	m7FxsfXeVR9CqWj96wgscmLY180HB7yvhqpevwDkCZvbQgASFYaNwdDEasXbcsLphCp8sIbAD8s
	qY6hhDpdk92h2zhbROq29moWquXjOkF6qJM4zQnfafje3RpAuyMK5xn79FMZ5S4kjChngzIPhdk
	pTLqNdhGsvQQpwBv1moImos+t8fXm+HAybpV/XwKiyppwz9xS1KXgpC0z16gGzZB4cT6l/TGPgn
	fp9zqIsEre+vjGEA1+cTSBwMNY7dKQTRFUhhzLkY3p3DgfkxPoJAH2dxR1hYD0jQ4NKJuQGAZWg
	GEsSbvVOSw3oGzXx9tX6xJcm2pE8kEYDh37eFv4/vA0NkPiFul1yccwj3kxUalGU5vxBEKlhqV+
	/HN1WmuYcMz+BCYx290q8GYjCDJ/5yNbuSpf3xlQbFKWoC2BRekgEiBZVX6yoMUjrTGI+dorULz
	qmdpUrYwYRSZrTQOe4MqStRFNJnQtQig2NAZoQWn/rFKgcqtegv9AbXd2XB0vI/OaKa6knSsbmk
	5eqyjIL0GkDr/XoAL02LiUAKo1Qbf7aYpuFwL9XG/7MJ2VhASGKZPMmk/JC8ZmA==
X-Received: by 2002:a05:6a00:bb8c:b0:883:904e:da56 with SMTP id d2e1a72fcca58-8beb677fb7cmr12261080b3a.36.1794887675077;
        Mon, 16 Nov 2026 19:54:35 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm4319559b3a.45.2026.11.16.19.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:54:33 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/6] mm/damon/tests/core-kunit: test
 sz_ops_filter_passed_last
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 17 Nov 2026 14:49:05 +1100
Message-Id: <179488734513.2.6285120857568566018.b4-reply@b4>
To: mattathias.pinchover@uber.com
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Mattathias Pinchover via B4 Relay <devnull+mattathias.pinchover.uber.com@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, SJ Park <sj@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261116-damon-sz-ops-b4-v1-3-1cffe7227e6d@uber.com>
References: <20261116-damon-sz-ops-b4-v1-0-1cffe7227e6d@uber.com>
 <20261116-damon-sz-ops-b4-v1-3-1cffe7227e6d@uber.com>
X-Mailer: b4 0.16.0

Hi Mattathias,

On Mon, 16 Nov 2026 19:10:06 +0000 Mattathias Pinchover via B4 Relay wrote:

> Add a kunit test for the sz_ops_filter_passed_last DAMOS stat.

Since the motivation mentions contexts with multiple targets, maybe we
could also cover two targets in the same context, with the stub returning
different sizes for each? Checking their sum, then changing the sizes for
the next interval, would verify both aggregation across targets and that
the value only includes the latest interval.

Thanks,
Aveline Noir
