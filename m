Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DDB497B76
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946481; cv=none; b=NNQY4lk+tJsPb7mP3cp58aIBh0jJzZaTP80Umj697dpIS7+5YgA35ksgHt1mjHomurIwxjYXLNPDuyIfKb55UJ4NJvX0gkQtOkqhmXMqiUhARLFPnpybHbSz5bDwHL1VEAaQQR31qgoxTCj7rNVQiScWYf+IXUZefNO7ldTy1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946481; c=relaxed/simple;
	bh=rxlktV5QmP9O8gmeTAM7mahiIUPXqUp0GbzhOcDZy1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3KaUq9Ntrun3Ys52Y+jqrOMZ7ihFImjsLf/5u++6s2bSttJQ0CM0teVFdUTB+hXJLC0MOpvemsNdOr8DXlsdvhtoHzXHYCeqlbuSsO+pcqIytKhDNT8TFGXbC8yVrHP/ohPk/tLjFpIBwRvILsJcFBpAKAcJT+Y+NhTujkpc0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/rsOFCL; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/rsOFCL"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso4878599b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946465; x=1791551265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxlktV5QmP9O8gmeTAM7mahiIUPXqUp0GbzhOcDZy1M=;
        b=c/rsOFCLbPkpGnUdO7dCdzXnjst5wuawgI5qbeA6LmR3Et50ZfxeUXYfiSSaAACqZx
         zA+hw2YXiUXWl3aEWEYBVLYhIsYJxCsYTbdtxtzvIfs7Hi0KTWRX7Pts1Kfz1sEkaR1w
         yeAIPAPXwfmeWVo3cQO6q1m1DNGthKts7MkIZBgM8cB6zclYlxaQgnirtO/lqysg9yHr
         M0ymfMhExRLZu2S29U52oTmreaxV9AGSxaCAvVOiM6sFzFGuKoWtLj+h5aiWm5oHCl3J
         5iHq0LUfWEpLNybqJtIr8oc2WDxRWs87/n125Tt5yaXaR4cq+l7cRfROxwWcBdI6ztj8
         Oxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946465; x=1791551265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxlktV5QmP9O8gmeTAM7mahiIUPXqUp0GbzhOcDZy1M=;
        b=qisnq8qJ8dJgsCM7hj+2vixZKGvWbHYLsEoh+r6K/wShS4SQGfpvoVmw8DwZgJiMk9
         ES+kdGBv51r8+JttLQ122Q04YRT7LMG7G7zbKF/XYNYihgIhnKCfUjvU+wduupJwuiHX
         n1/Thw6xSRFOBrf5XOtlGE68M5XHQcoMNDfWMzs9ENHqG8FLYpU4jNjhfvVo4oqult+j
         lAVeeGr9BCAzqxAwfggVRlSnos7QTDuDYu469b1hsBKu9te+K9uMhYVUACCv17PODi4g
         aqW/BYHTZiyK99iESvvodb4cAWlVLl4wjmtoIbzrKkOmQ6sI3CHIrYCXnTrQpiqcbvMD
         EdsA==
X-Gm-Message-State: AFuF++nHM0Nfa8CS7lipMUAAe1ucZKCAczXMlZ5b8CotAfVRggFaU9b+
	a6JP7JPxGkOuLqxSN3RLBpt5y79UfQ6GFOgcwB47CLKuXzSp6zGchs3r+MD2mHYZRdA=
X-Gm-Gg: AYBFou0HvOWlwQp34xvaCKlOHTVI2KXBqVKBqjhN41Q8GizIpXhZSwy4Z/CQchAJVWz
	ZAgzdEuZG7OzaI2RV3jrzB3WzljR2fA5vjbo2gHXXlr9bRdOXRGRFEfWWD9y/ysnsOgHxwZYDyF
	V1ERf4G4mZQa0R8cdj2Ew99DHXxAlwZuxVPVTk/x6XRvt/Cc/1ohFXLn/jTOaopylygbancYj3j
	1YioRnUHTAgF4nVBac3XE6OHl15rIclYEY582YT9Pa/KSLq/lKC8EV30+/VMe6uN3nvCKyq24Hl
	JsP9Iq5/A3WhKVtGR6zeTVE7khBPoEtyf9ezByu/8PalfZ3N2ENAws53VHhKR3CXyggHi1swcHN
	3twiS8bpG6VqdR+XVpAPD1Rbw2Xn3mVsgsXhnKJol5ypi/3jtQj6Mg2/lABjH9xsGR5trddScae
	AOaARFnKUz29acR9mY05nWg5WWeD8EjpAp0yX7YJ4sTHaJG7yE5oAjhUwWDMDAp9XV8mehRlZmD
	SzjGV3rqtXtw/0=
X-Received: by 2002:a05:6a00:9285:b0:874:706d:856a with SMTP id d2e1a72fcca58-88af7aade2bmr2356719b3a.27.1790946464816;
        Fri, 02 Oct 2026 06:07:44 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a4862sm853157b3a.32.2026.10.02.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:07:44 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	dri-devel@lists.freedesktop.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/msm/dpu: stop all video interfaces before cleaning up a split encoder
Date: Fri,  2 Oct 2026 22:07:41 +0900
Message-ID: <20261002130741.50757-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929131840.DF20C1F0089E@smtp.kernel.org>
References: <20260929130621.943-1-26rote@gmail.com> <20260929131840.DF20C1F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 13:18:40 +0000, sashiko-bot@kernel.org wrote:
> Could this result in the vsync being permanently missed, causing the wait
> to timeout?

Yes, the window is real; I did not hit it in 13 cycles, but nothing
prevents it. v2 stopped only the slave interfaces up front, and v3
follows Dmitry's suggestion and disables the slave before the master,
so no timing engine is stopped outside its own disable path:
https://lore.kernel.org/all/20261002130712.50612-1-26rote@gmail.com/

Thanks,
Joonhoe
