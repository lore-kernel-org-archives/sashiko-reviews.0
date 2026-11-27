Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742817;
	b=eBAV7lxVMR5mEzv/Cip8K3Oo6zUnTVGP47fZ4ESl82HBdzMgn5P4EiHEypedDA6hLDBs
	 CU4tMxznn8SDauHqXINUPN7ZlHwr97MVDNmYPd8z7wG2A7ezcjMgE8dJWMI/HqHUQjp3l
	 U9x6PVMNmq9NYLdJ+awPvq2E6T66D8Oui2eaKrSxnFLGUdzJxiCYamyEeif9kR0/HGy2P
	 Gjm1ZAIHACXqenWBfrz0NTGBH9T3fmi9wsU04ZWFkyXA8vMYygmxUhOdXzEAzXwZiJkIX
	 8GPyHALPjhBj0hj/lqiiurf/T86Gzfe9iZloOeMtmmOFC66bnVE8sUj9Xhtk5mGdLZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=agx1/QEyGbjChimrEJGp98b4hAyFpBve2ogiEqDdEV4=;
	b=YAvPPg2cnhLbtkbFzYHlxixwOgoj73BA+EdLRK4c2IebMAoMSabPCfpFg31mqiOkIQiT
	 gOnXUezQE5z5Zif6LP9aIwTVR8WlgIMrPYLXt7vkedvyUC4aFVBGh1e1iYEnR44w+bSDo
	 +j8aZhgjDfHDdzMW4HGINPB7ta+MK6/UjJkEuNASk0BWrehrBtqN4irlQ/LjRRPvzf6mq
	 tYcAtbd6ZWqW1bKNrQY5EsFGm0IM3IvS1O12PQWBzHtDx4vr6C+e4oY9EsYT3O/huEjSB
	 WnkMlFN8D7+gv4aSQ2awITOxVj907O0mhvXJ1KSI/sveuQREUkUlymD2PNeZgOCbvlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7GpxPy6;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B212606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B212606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7GpxPy6
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab938dc83so2963473a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 17:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742815; x=1796347615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agx1/QEyGbjChimrEJGp98b4hAyFpBve2ogiEqDdEV4=;
        b=w7GpxPy6xumjJrbEEQ9AwBQXDmqvaRrntbypqHMPeC8TE1xidW5kGCd7iZToyBN1+g
         9UWbpmKfgzBEXqnvh7I48I1louYWp+fPRVlVGPWEyg0Mvuvucj9rGmX0O0xNQuoSC6Af
         LnVCNGg5tjAA4AY6gFDZNoIedUDJB1s1gswOEWS67NWzszGqbZ3U3XdV9l0vjN7czPTs
         ffgwNSBLRvp/asxK7vc0sd61wvGRb63bFJTI2OOX5WaiGHfpQ3/LEtaeoPUbXqTLTZKF
         2ucnfvHvlKt/39kIui5jolu4tXttuAg1rypTj2vOA6zlof4g/q1HPSBbStvaIRvmU3Mq
         HBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742815; x=1796347615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agx1/QEyGbjChimrEJGp98b4hAyFpBve2ogiEqDdEV4=;
        b=BIbKw9PS9wnPTf4mdQ/SO/Dr1aA5RDUNyhm6436ivvRtf9UTt43n7nbVi08V4aWuie
         nFyXNPwJkEalfqVrvTbORoL0Y+vpH0Hepk000xSVGYbO5onwfJ8YH5TjesSuGMB71U7K
         GfkkUmUhv/r1I1UJrx/zSU3j31hrYFm5U7VbxcchD/eQKQedJtnjYSJyIHyMeFRAahQG
         fqsYBhGSlf1tQnvtyuB1hHQerggWuSgVsWqO7PUxps6dpVUioUR4KTnvKf5EEGXdDgqx
         a/Srceu9rKg1IDvHdOVLPJ3aQMGK3Qmu29FgUPeDS9LnKOpBsCbzbTOO5JUbS0Fwjkp5
         hshQ==
X-Forwarded-Encrypted: i=1; AL+hErH2mRJLBeFR9nxWi4f9MdNQDcV+B8RxFGx/kA/YwA1OiHM00XBWj2wFNN2vy/tls95R3dqlVunzOqeSpIyEjN8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+l51Cuera2US7p9KNoQZxhxxr1QQXsDbPYvIeJxzuu6cBkSOqI
	I6hN0METeu/r6j9xciuzlmx4CjXbBCkiO693G6INHbQ+efYF+aXHXQ+12tBEOiDxxoA=
X-Gm-Gg: AZFdTZc00GsuM9vBmyGjHCy3M5zr/SHLuXIzoyzqVMJ47Uf1FE7Wq8mTp6eEJGLy3VQ
	gw9rxFO1ISwPPkVtCka13wVYPCDiTBp3gg5QeZmaqYgWSF8uvHG1/UeHI2CWCXCTrhQs0sSIZ4F
	mdWc58GKQV4Nrn837B0wT0gH2qyOMasosEEzKVfDJI8LM8hZq2AdQl4Hwd5NZnrmdtqWXUOeF9V
	iQ3Eht78z8Fon4QiXCKc/ve8Wu07wzJC+tumNtq9Po064/g5xmE6uqIa2VcLY1bAD4cpuYgWXHe
	9sdk8klMAVsEX66QTSaPHRLtz63eKq+dzWIXEJcOlsQ1RUPCBJjHYHa8wzg+N2O7mbVZmxRnfLU
	p9+PycY/hyKBZl9Lmk2kGc/HUgVl+wLi6cm0KgChrZNSeQMpCcrsFd0MUICKPrMqPEA5EJmfpHV
	MMfbveMRNto98VDoKyFVqAQXpxv9S+yqFv6cKFtKTTSrGGqHTfs4rqCV6fXciSZAnhBjlsoMFYw
	rgiuuYWUT5aMKGmXXOTatUBzict8sR9JGQSAjpq37E5Cc03y1UwRk+168yelunaKBkgLZfk7LjI
	Qmg9OwxExilJpT+pOtfjj9vOqfyWIKtQ5mkvLu3fWLos1ziM6lPeZNHANn1VTIwhaREYcSQz0Fb
	Nqs+WzAhaQ2Rgww1kpf8NJ9fHh+DzHsk8roWsz+ryM79Atg==
X-Received: by 2002:a17:90b:2c84:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b41c8fe256mr20560948a91.17.1795742815391;
        Thu, 26 Nov 2026 17:26:55 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:54 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 4/4] iio: adc: Add the PocketGo S30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:12 +0100
Message-ID: <20261127012612.1589039-5-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PocketGo S30 handheld (Allwinner A33) reads its analog stick through
a microcontroller at address 0x60 on i2c0. A four-byte read returns the
two raw 8-bit potentiometer readings, each followed by its complement:

  <a> <~a> <b> <~b>

The value and its complement appear to come from consecutive samples:
they differ by a count or two at rest and by more while the stick moves
fast. With an exact check, about one read in four is rejected, and
about 4% still fail after three tries when polled as adc-joystick does.
The stock driver uses an exact check and silently drops such frames.
Accept a difference of up to 2 instead and read again, up to three
times, beyond it or on a bus error (the MCU occasionally NACKs its
address): over 2 x 6000 reads at rest and moving, none failed and under
2% needed a second try.

Add an I2C driver that exposes the two readings as raw IIO channels, so
that adc-joystick can read the stick in polled mode. Each channel read
fetches a fresh frame.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 MAINTAINERS                          |   7 ++
 drivers/iio/adc/Kconfig              |  11 ++
 drivers/iio/adc/Makefile             |   1 +
 drivers/iio/adc/pocketgo-s30-stick.c | 149 +++++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 drivers/iio/adc/pocketgo-s30-stick.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 253275882ab9..7f99ad72e412 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22256,6 +22256,13 @@ S:	Maintained
 F:	drivers/pnp/
 F:	include/linux/pnp.h
 
+POCKETGO S30 ANALOG STICK MCU DRIVER
+M:	Romain TISSERAND <romain.tisserand@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
+F:	drivers/iio/adc/pocketgo-s30-stick.c
+
 PORTUGUESE (BRAZILIAN) TRANSLATION
 M:	Daniel Pereira <danielmaraboo@gmail.com>
 L:	linux-doc@vger.kernel.org
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 48a0c4a88731..e1d619dcf0e8 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1443,6 +1443,17 @@ config PALMAS_GPADC
 	  is used in smartphones and tablets and supports a 16 channel
 	  general purpose ADC.
 
+config POCKETGO_S30_STICK
+	tristate "PocketGo S30 analog stick MCU"
+	depends on I2C
+	help
+	  Say yes here to support the analog stick microcontroller of the
+	  PocketGo S30 handheld, read over I2C. The readings are exposed as
+	  IIO channels, for adc-joystick.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called pocketgo-s30-stick.
+
 config QCOM_VADC_COMMON
 	tristate
 
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index eba4d8eb716a..d707ce30e728 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -123,6 +123,7 @@ obj-$(CONFIG_NXP_SAR_ADC) += nxp-sar-adc.o
 obj-$(CONFIG_PAC1921) += pac1921.o
 obj-$(CONFIG_PAC1934) += pac1934.o
 obj-$(CONFIG_PALMAS_GPADC) += palmas_gpadc.o
+obj-$(CONFIG_POCKETGO_S30_STICK) += pocketgo-s30-stick.o
 obj-$(CONFIG_QCOM_PM8XXX_XOADC) += qcom-pm8xxx-xoadc.o
 obj-$(CONFIG_QCOM_SPMI_ADC5) += qcom-spmi-adc5.o
 obj-$(CONFIG_QCOM_SPMI_ADC5_GEN3) += qcom-spmi-adc5-gen3.o
diff --git a/drivers/iio/adc/pocketgo-s30-stick.c b/drivers/iio/adc/pocketgo-s30-stick.c
new file mode 100644
index 000000000000..09a60cb307d9
--- /dev/null
+++ b/drivers/iio/adc/pocketgo-s30-stick.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PocketGo S30 analog stick MCU
+ *
+ * The MCU samples the two stick potentiometers and answers an I2C read of
+ * four bytes with the raw 8-bit readings, each followed by its complement:
+ *
+ *   <a> <~a> <b> <~b>
+ *
+ * The value and its complement appear to come from consecutive samples:
+ * they differ by a count or two at rest, and by more while the stick moves
+ * fast, so an exact check would drop about one read in four. Accept a
+ * difference of up to S30_STICK_TOLERANCE and read again beyond it. The
+ * readings are exposed as two IIO channels, for adc-joystick.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#define S30_STICK_RETRIES	3
+/* largest accepted difference between a reading and its complement */
+#define S30_STICK_TOLERANCE	2
+
+/* signed distance of a + b from 0xff, -255..255 */
+static int s30_stick_mismatch(u8 a, u8 b)
+{
+	return a + b - 0xff;
+}
+
+static int s30_stick_read(struct i2c_client *client, u8 *val)
+{
+	u8 buf[4];
+	int i, ret = -EIO;
+
+	for (i = 0; i < S30_STICK_RETRIES; i++) {
+		ret = i2c_master_recv(client, buf, sizeof(buf));
+		if (ret != sizeof(buf)) {
+			if (ret >= 0)
+				ret = -EIO;
+			continue;
+		}
+
+		if (abs(s30_stick_mismatch(buf[0], buf[1])) > S30_STICK_TOLERANCE ||
+		    abs(s30_stick_mismatch(buf[2], buf[3])) > S30_STICK_TOLERANCE) {
+			ret = -EIO;
+			continue;
+		}
+
+		val[0] = buf[0];
+		val[1] = buf[2];
+		return 0;
+	}
+
+	return ret;
+}
+
+static int s30_stick_read_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan, int *val,
+			      int *val2, long mask)
+{
+	struct i2c_client *client = iio_device_get_drvdata(indio_dev);
+	u8 v[2];
+	int ret;
+
+	if (mask != IIO_CHAN_INFO_RAW)
+		return -EINVAL;
+
+	ret = s30_stick_read(client, v);
+	if (ret)
+		return ret;
+
+	*val = v[chan->channel];
+	return IIO_VAL_INT;
+}
+
+static const struct iio_info s30_stick_info = {
+	.read_raw = s30_stick_read_raw,
+};
+
+#define S30_STICK_CHAN(ch) {					\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (ch),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+}
+
+static const struct iio_chan_spec s30_stick_channels[] = {
+	S30_STICK_CHAN(0),
+	S30_STICK_CHAN(1),
+};
+
+static int s30_stick_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct iio_dev *indio_dev;
+	u8 v[2];
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, 0);
+	if (!indio_dev)
+		return -ENOMEM;
+
+	ret = s30_stick_read(client, v);
+	if (ret)
+		return dev_err_probe(dev, ret, "no answer from the stick MCU\n");
+
+	iio_device_set_drvdata(indio_dev, client);
+	indio_dev->name = "pocketgo-s30-stick";
+	indio_dev->info = &s30_stick_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = s30_stick_channels;
+	indio_dev->num_channels = ARRAY_SIZE(s30_stick_channels);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id s30_stick_of_match[] = {
+	{ .compatible = "miyoo,pocketgo-s30-stick" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, s30_stick_of_match);
+
+static const struct i2c_device_id s30_stick_id[] = {
+	{ "pocketgo-s30-stick" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, s30_stick_id);
+
+static struct i2c_driver s30_stick_driver = {
+	.driver = {
+		.name = "pocketgo-s30-stick",
+		.of_match_table = s30_stick_of_match,
+	},
+	.probe = s30_stick_probe,
+	.id_table = s30_stick_id,
+};
+module_i2c_driver(s30_stick_driver);
+
+MODULE_AUTHOR("Romain TISSERAND <romain.tisserand@gmail.com>");
+MODULE_DESCRIPTION("PocketGo S30 analog stick MCU");
+MODULE_LICENSE("GPL");
-- 
2.43.0

