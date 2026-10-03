Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD737B021
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791005183; cv=none; b=kbrfk1ELI3NjigQs7hMumyf6r7qQXKM97t3iq7hoyM8KvX+hRL63CjM6ZFVSKkGv2XHeJCoTksGb+e1pCqbX9XXMYoUSkp5q7pyBFM95wwaWLLKq6f5XkUpiF0Igxix0ogBKR1NY6IYMsN2DINOzf5V77V8jE0aIjeaiQhici2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791005183; c=relaxed/simple;
	bh=op4aSA+XgB5lSJN5ZiyPQbZ2ip5BcNDg23uH3MDzkM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEuLEB6Q1Yj/g47SQHFDB7HYfLAsEbYB2c04zbppkT+LXba3jDfKFFXrIUF6/QaVNmV8wj0ll/q+LxFEJl6OFNKlKGU6eNVXR+fX9FI9AsW2wAz1nhrhNphK6I3Wa4vRD0F8UbTBGy/PMDi+NtGJbwxk+B82YpxlmYLsZ5cAKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdbQRmH9; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdbQRmH9"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so41660eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791005181; x=1791609981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9JTd/C76t5r8bTsnEDhlS/YkoysQFw3zlanAllm5PQ=;
        b=kdbQRmH9KBySC2QFlkWfhb7WC7QWndSDVAqg7OSDy8DyWTSGNJ3G6UMmqOREzj76iN
         B7QPik7/O3rnbk8ze0oZr1X0z1PqUFWMSjS3tQHJ1D97ahmsZjy5x61+yyjq3wwqVjZP
         CGYyujr/2n0oejmr8PhGitcKzbIdR6IA1bFMMGdL2vFs5raFddMaWh17dDZikk5QC7Js
         WaLASWyXrmhcHc6G3A+45mgtjqSvEovhCk6lxT/NbGW+TwIdFgxnYshjZJPqkbmEw4bK
         qLkhCkSUoVoVHbs4tY3FKLCBEYWGbC6Z5DoFqtX0ohwmcZeDy0x+sOIu8B1TtNaYirdb
         CDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791005181; x=1791609981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9JTd/C76t5r8bTsnEDhlS/YkoysQFw3zlanAllm5PQ=;
        b=mAaFpVzIAtWMB4IUScSM1gXtwVyzGmc55Bux34jE6paaQ6rdsnUiTETpZgUFWGRaSP
         PTezPHgGmNRB8w3RZps90EVrxP2+z5raDqnuG4dqeuT8YXHS+++BKy6IZqtxEud72aBt
         +b/JooQJ7WS3Ip4OoqO9SE5Q5nmzbSjL/2tRLZ3S5iqbt8fmA+OFggFE2/KTh5+HhhXK
         WzNvRrWs1XtoY7g+CxX+IlZ6i9D4Q1zJT+yQweNIM3EGz8FcQvbTc9kYkh0Mb1bbVomz
         HYlYBSpRtCwNVFP84Ge/7KG0U/ZChTBpCaR2sbXbS/Dej+Hmpmrl28QNrheS8Sme6OF4
         9Anw==
X-Gm-Message-State: AFq9FYJ29TJHvP/xA4ShOhURjVZl7/khz/5VZLfyxNgs+pysSX0jkv/O
	6NGhTxVvwH6/qGmdzxxSxFjIljXGoqUEXUlS5d+06qdt5WtvrhmmVoKl
X-Gm-Gg: AYBFou0PhDbs+WCvg/4YqeS56yN9A8i02BPgFUx0P/9UNrU5cxBogRypN2fE1JZ8pC/
	4QtmV33FSPvAsgovubauzjVFxTq+pGzLad86e30tgYGy8CStYkmpaZIueFnWNPcACivPmq/HkR5
	87LqU1uWPnlaEc/eOBMsG5iZljS4CYH8X3EE30hD/m1SxrgqwaOwjFNYb1Y+NY/QOo1FLaeDXrO
	QERcpTyK8uhcmydINl8zqbNP+aWnD2XPnckULnldpENZLib6WlrPBfvuJVlZGIgjGENbvFe8vLb
	WwaK4kwAAiAhw6TqyjKaEHM/fpa5j7gOv1z6g6jCf62ijg0lB3L7dfpC1acZoAhMCBUamDj0csa
	zEFas2V2/lAzhWeAx9rZ+Se1fT6iga2CamZ/zdLAGULc4w8anijN+rfX5kp1AGAykbukqd+9oGQ
	oS5Go+ndZwTi5JhGe/I6KRPruEgayPHBELW7RorT44LJ9DcXSlA0Xf+Fy/4D9JnBUa9DFBlrnUz
	18UEUiadmDwqIA3lJ+f7o5b2d3GIBYjPBxxoXkx
X-Received: by 2002:a05:693c:88cc:10b0:351:1131:58c with SMTP id 5a478bee46e88-35111310762mr1881138eec.23.1791005181373;
        Fri, 02 Oct 2026 22:26:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f6b0:90e5:8010:fce8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd9698sm11542217eec.23.2026.10.02.22.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 22:26:20 -0700 (PDT)
Date: Fri, 2 Oct 2026 22:26:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kendall Willis <k-willis@ti.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Input: gpio-keys - support wakeup pinctrl state
 on suspend
Message-ID: <asCRyl0MeG1AWiZW@google.com>
References: <20261001-upstream-gpio-wakeup-v3-0-6f3bcde367a3@ti.com>
 <20261001-upstream-gpio-wakeup-v3-2-6f3bcde367a3@ti.com>
 <20261001160201.4F53D1F00898@smtp.kernel.org>
 <20261001161231.eopj5fqxfn6d54sz@uda0506412>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001161231.eopj5fqxfn6d54sz@uda0506412>

Hi Kendall,

On Thu, Oct 01, 2026 at 11:12:31AM -0500, Kendall Willis wrote:
> Pinctrl is optional to use for gpio-keys so we only care if
> -EPROBE_DEFER is the error from pinctrl which would mean that it just
> has not been probed yet. All other errors can fall through and the
> pinctrl_wakeup variable would be left as NULL.

If pinctrl is not specified, devm_pinctrl_get() returns -ENODEV (or NULL
if !CONFIG_PINCTRL). Other errors (-ENOMEM, -EINVAL) indicate genuine
issues that should not be swallowed.

Please reset ddata->pinctrl to NULL, ignore -ENODEV, and propagate any
other errors:

	ddata->pinctrl = devm_pinctrl_get(dev);
	if (IS_ERR(ddata->pinctrl)) {
		error = PTR_ERR(ddata->pinctrl);
		ddata->pinctrl = NULL;

		if (error != -ENODEV)
			return dev_err_probe(dev, error,
					     "Failed to get pinctrl\n");
	}

Thanks.

-- 
Dmitry
