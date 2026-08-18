Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116BC377563
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064533; cv=none; b=VY9J6hMHiGnSj2dJEw2LyhqDJS2WoF2aOlwk4GWxV20NYRZNFMqEz5qtLp9o3oA9CMOV7OIMERm9Z0yGdA6BaXw7l29064iIin+pmPFpbjzOGJFVR75chr8Jy7D3l4DcJHTGTZsj7Su2Hc43L7wDStJ5hEcFS+pxt2vBHfkGk+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064533; c=relaxed/simple;
	bh=ut+2eq7WSaSVlLblrB/noknMPuxRnWmAtoR5s0E3O/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUL+Ywv6ppYki1LzZp7JoOIx8gzlSa88c/48Au7Xrg0Md2dUlPxu3YPuM7FxuB3WTGDq1kSx7mgweD47cmsc79moKZs4nBV4ORSBB49+LpYHkvchGtnyu9tEzVaLQwgPJbBx5HzduZjyEHxjs4Wi6EUCbNJDCAdlpshSGd+kuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9HQn5II; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9HQn5II"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84eb992a881so3672986b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787064530; x=1787669330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5b3SGhODqk0c4vJ8OoIQWWGMwcq+bbZgtoc9iFh8o/E=;
        b=h9HQn5IIUEwsJQ5yFFBiyI6loA6bGvzkAOzvKhgNzJUga6e+QfeXnuW0N901VTuWYh
         W0cayV3BQ+wNnu173/b3qse811o1nzpfComNXpd/NqtDt1FhfXx7FRDerQpKrPFB39cV
         19+Iwj2acrT6fo1cnTFablAZyVSGdspfYP7a5AmOoSCwntoA7CGF0iHWo7mkI/BR0Elx
         BEx2j9q61Q+G6GBnTEbz1TnJfcigEOG7AehH/WV2uA0Fi0tqLZF9ZuegKiNg9rvdx4rD
         v6uqZhqqgiU/uv+g5ULkvjTMO5BjNnkpyMTvH128nlCcgMPrU3P1BjP1M+YlYlD4YRtW
         qLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064530; x=1787669330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5b3SGhODqk0c4vJ8OoIQWWGMwcq+bbZgtoc9iFh8o/E=;
        b=Hh/CgnSlW84A1JO29M5tsAlpif+y0CMB6VMP8XrMIGTJ1hWswzrcJCqvirCp86Oe40
         WjEeMlhsZDFm9mhaW58lse9YjvQFOnWFLEkqLuJWIyU8qBKaeletqHlc4twaZ7cOk84j
         TvMdqjiCPjyxxEcsoVh4a6jla+xORQPvaBep0IO617Hhy2I/8r5E+uC4TLjeCJ/Y1b8h
         1xYsKZTxi/Mj2JAoRnzSf/7DTuOCCFec/M0lkQNRUvpGoV0b56g9dKl/h3ArEl8S+soj
         6Hf87irT9XqJpap00vc/pUCmM27WspbS5B3LjB3LuQGyKNezUreBwOCQliZY1/2eeUIN
         YQ4g==
X-Forwarded-Encrypted: i=1; AHgh+RodIzo6bav8Fua9SZNHvqSEj82ePA0bUs+HXEWBp9ERADfTTCaJMZsoW7Iad5khBdSvZtTi5ealpNOJrMDFDzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx1VRfaC3nrUS/4ip4LB5sJYaQrRggqKwuaQnYrVP4NFJFm9Wr
	awAhwHmoMXFsY2aOabYB1h06ujVdlfoMaUgvke9Ovbzd7HCy8xkOoU8=
X-Gm-Gg: AR+sD11ha10XSLjWEi8Iq86wvwwjjd/KgL6eYYyxE+5sRCbxBCOjCQXvsQHt3EvxEFb
	PJRmRHntPUxOel8Kinn8P+W8UWyJmMIfoXagm0UMLlN6F/mAJ4OYhG64B0/Qn4uYSHzTJwNYmjD
	Bcgsh/2kbp8i40V9+YxGu8f/RdTmvF55yzQm2qpYjZqdOWjJnkaWONWEeUG2KPSM5WSL0dDzSXu
	sQEgzABGRgRA5KyRsYkUplt2xDRajZrIOeCUT5jOdiPOvzA5Z1jg/q7rsInB20A2oldIb0Ak10T
	u0tp853Kx5IaYmUtKuiWFnJuuxs9vEoRTd8Jm2cSrn/CDsnoZ/TQpo8D8jq358GDBblhpoJ4+TK
	9yFouOqsuc6cxjCi3NTcyrnVH0QrxHfwI5qmvZDRi9ADZwOMAjuMJ6uBCZdplh8JsZNGniOivWv
	oL6uQ9kbOg7b6RWWK0itvUk03Q8SP2DQIeGiNNb0FWz6+Rb8ey0U+8EIefZEcvhbWLZzk1ztNnZ
	bwRwZKlFS5XX6Np5fUGiNGwAqk9gEhu47T4FLMzE7lcqvKnEKFdla60YYx4Ubv5uABymoz0dg==
X-Received: by 2002:aa7:888b:0:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-84fdddf222fmr33587088b3a.0.1787064530349;
        Tue, 18 Aug 2026 07:48:50 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851c5382f1esm638832b3a.41.2026.08.18.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:48:49 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sashiko-bot@kernel.org
Cc: linux-perf-users@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	triet.hoang.dev@gmail.com
Subject: [PATCH v2] perf unwind: handle allocation failure in libdw__get_entries()
Date: Tue, 18 Aug 2026 14:48:37 +0000
Message-ID: <20260818144837.741469-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818142902.639F51F000E9@smtp.kernel.org>
References: <20260818142902.639F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of zalloc() before dereferencing the allocated
dwfl_ui_ti structure.

Return -ENOMEM when the allocation fails to avoid a NULL pointer
dereference.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Free the ui structure before returning -ENOMEM to avoid memory leak.
---
 tools/perf/util/unwind-libdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 7f35042be567..fd8a5125468c 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -379,6 +379,11 @@ int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 		dwfl = dwfl_ui_ti->dwfl;
 	} else {
 		dwfl_ui_ti = zalloc(sizeof(*dwfl_ui_ti));
+		if (!dwfl_ui_ti) {
+			free(ui);
+			return -ENOMEM;
+		}
+
 		dwfl = dwfl_begin(&offline_callbacks);
 		if (!dwfl)
 			goto out;
-- 
2.53.0

