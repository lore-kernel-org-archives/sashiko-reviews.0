Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2131F5EA
	for <sashiko-reviews@lists.linux.dev>; Tue, 12 May 2026 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569678; cv=pass; b=pKJVf/Lrt1/DSbELt8OZQJN/wYCaUvYqzakHaPIONoUTtb+znIZpvxWc3/jfheb9K4ZQUTFmRRtmjtzNyj+pLkdwNopoDfFmmIwKLwU7KmURH8kXPTyUIm0k1RjS49JiiMEviPJfJzoUBBaiTt/z81R4VEUTuJz1NUUw0RS8nDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569678; c=relaxed/simple;
	bh=YqITAjt5Ryg3f/2/MYnxUTqhK+fjL7vQBAltc8s5owE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eZ0ZbHb2qdxL2X9Z9h+KpHEQb3j8sf5he+Xk2Zit94Od/OpfbFNkp3mQpATSphKk17vEF3ByghoJn8QS+lzePwkbBFNHTkjDIMZaMxmGpiQKOH3O5tVvqn3wkkWhXdT4kJSNsBjpgAnRmV4O6YpJhg7A0uqUQJGYDvCWd3EkBl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BRdlLJ5+; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BRdlLJ5+"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-40974bf7781so5009221fac.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 12 May 2026 00:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569674; cv=none;
        d=google.com; s=arc-20240605;
        b=BhG59cr1XtoIC9zGqELcVBFsBAkeZa/alNepwBvIt3kL1W8/kWgC6sP2VZwPfczZQt
         nRWwuiwaUp11GfCJbCZCzkiNomghLmBY1LzItJprfZGKmQNougRkGE22kpShX8GLE4mU
         m9c8tiXPS26j/407m+IhbMgm8WplzEEzOGS91OGcR/RudxsXU334oA83tVuz8LUqt4dI
         z3WQzdJpy90yM+hK4yTSjCSYWlYjYfCqIDL24Mmy680Pgjnx33O0xIWaJ9Rs4Qz+Xa6N
         FMrXEwfnw9OGr0Hv54nS0eKNn9YND05SI11gm+BrvJqfQIcf6urbJyUcXgd2tl4DgF//
         ClLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YqITAjt5Ryg3f/2/MYnxUTqhK+fjL7vQBAltc8s5owE=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=BmZmvvmgejYz7oDibVSPAZqqnnJQh4u5ZDB4y/qFtHUOMzczn+toU1bF2Kw8KW/qDY
         HlQmpCr4yHbbKTKH8vQ1LjmHOV6R4ou7FSsWHu3x3dyy/geFotl1HqlUrsDUCTRWwVgq
         ZZjOo+1vFb/Lny5Qp2gRAEbk6DNXup1TXyEOyHWvgok5BnwgJDE6SX8D7bQPaDzPhOuH
         visDGrdxIjDUbD2uMIQrOZ/XtwKcKvvG6CMz6JQJyKXye3O9mpIM3kfysOldfM1zrbqb
         vNXesIsf9BPjUhXBhAJXfuYq1e0OfUeAbE+aBfg8B0YNs207EXGOI7nh+qOZZqoaykWD
         w+Vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778569674; x=1779174474; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YqITAjt5Ryg3f/2/MYnxUTqhK+fjL7vQBAltc8s5owE=;
        b=BRdlLJ5+uVAwviVpuFsbj6n0D56H2ByS0iBDwSVnpLmfvCg8AfKo6MsZ46wrN5ZJEz
         nTuPEs1/ZO+cA2i8VKop3ORillXkYqHHWRO3asNSs1BEiz/zeS4InLXla+YOdIJK20Q1
         oLUCXYAnobDD5DhaRtXVbqsVz62+j7LkAp4Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569674; x=1779174474;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqITAjt5Ryg3f/2/MYnxUTqhK+fjL7vQBAltc8s5owE=;
        b=jmzFp3B6Gn5wKOVu+jXKNi9xLKVziB84coeA1KoISmnccPD8v7gkjvYodOkN1xRJ5J
         V7D7r36scL/z8vhT0yNCCnAeTqCNUGxtA2McnnTYUFZ9SPBJV/KihbT5vW4/H5jMp8i6
         0/irYiArQ59iwJpfdES/XPJLot7+PmWPuvzFyTPGZ5ZVVTOog+acknWKb58miU9UGRYD
         Ig7IRDAztaH/ZvHaCH2Yazak6QnY3CF9pRJpcRTS5lCtaZwyHaJq6UoPlPBg5/c21Cqa
         oC8zUAu1d3eGdxFXNkcIh8H+jf+56YSPUL+4mNZ235Jkh+43m4ZZdaWGrTX1MVHQPN43
         3xfg==
X-Gm-Message-State: AOJu0YxMlFru1ygVhawADZADP2PVV1JFyc90bV0BZn3vsuLcSaZmXjKQ
	ory4ARaqJey8HcBjd3YWEG6ZRK013KNsHc86eqCAcYnNBnztqM2Cd0cs7/ckze17RoyPGgA99lt
	r9bPNyHWq4J9HuSGNe+6VfcNP/WHGl+3FyDP7U7CSgjpxgYqrIvGtLjo=
X-Gm-Gg: Acq92OGQSb+noOIgzM3qjI1vbxuS+tyZ3yPGq5XM3GMmRoK7EsB/YJYUC4d1vaRJDus
	d0eZVTNCl8j5Z2U+CQaGUQ4dFTnOq1ffl8tp0itK7TZyU7SUenUeoZ/sCE5wwg2OGQpoHaUvXTg
	gX+tfYmjgCeYODY5JQ30SYdDcnUXEL2yaUYopbbMssB8fw3gQvX4tLjEkYr8e8vCyDcGrUdiAX+
	sXFpzlIRPFWQ/upmmQNKv+S4IAuheLl2OpSbzVtFY/71DLtoCHeq+QVgklPnj2P5t1Q2dM7z0Jw
	8CR4wMZRFA2bbYjRVlICp98CWD5fpf/Eq8iDnw==
X-Received: by 2002:a05:6820:4dc1:b0:696:7f01:94a3 with SMTP id
 006d021491bc7-69b6788a7famr1472689eaf.37.1778569674457; Tue, 12 May 2026
 00:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Hoy Poy <choypoy@linuxfoundation.org>
Date: Tue, 12 May 2026 15:07:42 +0800
X-Gm-Features: AVHnY4IZF0EHifWqgm1d5QRa6poWDGctkm7LtjoAa2RQprJHVCFgGyk92IhC5Bk
Message-ID: <CAKkv+gzsLJ5kXuZ-ywSt=FRj3-6x10LMALjP7MhzX7hmA4PiMA@mail.gmail.com>
Subject: test
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

test - first post

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
