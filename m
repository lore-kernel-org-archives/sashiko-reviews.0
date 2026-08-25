Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD943FD14F
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664393; cv=none; b=L2i0n23BZKrIDVtUdaJdRDT2ZYo8uFE8GEBXnFiCaeD5Hexpb1gdrWU5kBjYFoggFIJzX7HD4N52gLtb07aHBux4lJsZYdOHaylBL0k81aChw3gWfSXJGltgCv2bDif3eYcZDmOULHi9NtvWnrTFBmA98u7iwYYRU6CtuSQ+5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664393; c=relaxed/simple;
	bh=+wabpMdqtsliqdIXgzzV3mZNMO0dOr8R4C5EtXhaqjc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LiAa0RIwz4BTXfZ+JhpxtANSCJFUenqw9qnRXVlBeQBtbbxy95MQn+FQRc0B4tOSLyThghKv5WZeaJW+CVV9uGDo1OpBqnE47V+JsAezRXL6pKMadGU6OfJ88+1B3MgZZ/oDCwoLSDWp1n1v0fEIrt0n2PQ9uNc0i1phnW2DkMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=SBMqDdHT; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="SBMqDdHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787664369; x=1787923569;
	bh=Xcobj1WbtNCpSLg5LjYRTxyLeZGzjny7gDMENHUb54M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SBMqDdHTIXWTLJ+9MfdFqqubFT5XKN37KOebg4JrRGoN+uuQt5xEi2HaRKAtCgpnh
	 l+cLNkls5rrB65suOzYMDvaif0JDcix1atUKFR6f5RpCE+s9v1Oam5Br62KkkBdwgt
	 hoPL3UnkB7mKLZEVZxeKa4fZJbaPPdrdQgvhFk/5J5v1uTInSWFbKT6Z3LBY4wUKBi
	 ZAB3buHM/ITyElLH8pezewOLsTi2wV02lTJyVl+oAHFMlJdmdBvPu0zXLiGvLuMOMW
	 T6FMfW+v18J+Da8k8Oe89fpyJzqQpOqonac64/HlFFZs9EmcC6sIB2fsHQVHtU8Laq
	 M7e561pjbbY6Q==
X-Pm-Submission-Id: 4hTpSv2jsFz2ScdY
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <robh@kernel.org>,
  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
In-Reply-To: <20260825084232.C01211F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:42:32
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-5-9b252804ee80@geanix.com>
	<91GhVUP-80gkcISIz0dE2ynhBCleQAdud8LjQ0jw35yVrdKs2GYLWLJmrR5D1F66rapeWHP1SLbjJSWs5dv5sA==@protonmail.internalid>
	<20260825084232.C01211F000E9@smtp.kernel.org>
Date: Tue, 25 Aug 2026 15:26:06 +0200
Message-ID: <8733w2nxg1.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Critical device register configurations are lost after a runtime=
 suspend/resume cycle because `mma8452_runtime_resume` fails to restore the=
m.
> - [High] Sysfs read/write callbacks and write_raw paths access the device=
 hardware over I2C without waking it from runtime suspend.
> - [High] The `mma8452_remove()` function accesses unpowered I2C registers=
 and causes unbalanced regulator disables if the device is runtime suspende=
d.
> - [High] `mma8452_runtime_resume` modifies device active state and config=
uration registers without holding `data->lock`, causing a TOCTOU race with =
`mma8452_change_config`.
> - [High] Read-modify-write operations on I2C registers in sysfs operation=
s are performed without holding `data->lock`.
> --
>
> --- Patch [5]: [PATCH v6 5/9] iio: accel: mma8452: Allow open drain inter=
rupt pin configuration ---
> commit 0eb3a6b1fa62842d47690cc795da7896eb5b7153
> Author: Esben Haabendal <esben@geanix.com>
> Subject: iio: accel: mma8452: Allow open drain interrupt pin configuration
>
> This commit introduces the ability to configure the interrupt pin of mma8=
452
> chips in open-drain mode. It reads the "drive-open-drain" property during
> probe and updates the hardware configuration accordingly.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 8eb97e6793d6f..d1e8eb2a4ad3a 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
> [ ... ]
>> @@ -1829,6 +1853,10 @@ static int mma8452_runtime_resume(struct device *=
dev)
>>
>>  	WRITE_ONCE(data->suspended, false);
>>
>> +	ret =3D mma8452_set_interrupt_pin_mode(data);
>> +	if (ret)
>> +		goto runtime_resume_failed;
>> +
>>  	ret =3D mma8452_active(data);
>>  	if (ret < 0)
>>  		goto runtime_resume_failed;
>
> [Severity: High]
> This is a pre-existing issue, but does mma8452_runtime_resume() fail to
> restore critical configurations?
>
> When the device autosuspends, mma8452_runtime_suspend() disables the VDD
> regulator, which cuts power to the chip and loses volatile register state.
> Upon resume, only CTRL_REG1 and CTRL_REG3 are restored.
>
> Are essential configurations set during probe (like DATA_CFG, TRANSIENT_T=
HS,
> CTRL_REG4 for interrupt enables, and CTRL_REG5) lost after the first
> autosuspend?

Yes, I think they are lost. Looks like suspend/resume is not fully
implemented in this driver.

> [Severity: High]
> This is a pre-existing issue, but does mma8452_runtime_resume() introduce=
 a
> race condition by not holding data->lock?
>
> The device state is modified to ACTIVE outside of the mutex lock here. If=
 a
> concurrent sysfs write checks mma8452_is_active() and sees STANDBY, could
> this activation occur just before the I2C write executes?
>
> Would this cause the hardware to silently ignore the write since the devi=
ce
> was unexpectedly transitioned to ACTIVE mode?

Yes. That sounds like something that could happen. But even more, all
the sysfs attributes does not even try to resume the device if it is
suspended. Which is also your next comment/issue.

So as mentioned above, suspend/resume implementation in this driver
seems very much incomplete.

> [Severity: High]
> This is a pre-existing issue, but do the sysfs read/write callbacks and
> write_raw paths access the device hardware over I2C without waking it from
> runtime suspend?
>
> drivers/iio/accel/mma8452.c:mma8452_write_raw() {
>     ...
> 	if (!iio_device_claim_direct(indio_dev))
> 		return -EBUSY;
>
> 	ret =3D __mma8452_write_raw(indio_dev, chan, val, val2, mask);
>     ...
> }
>
> Functions like mma8452_write_raw() and mma8452_show_hp_cutoff_avail() do
> direct I2C accesses without wrapping the operation in
> pm_runtime_resume_and_get() and pm_runtime_put().
>
> If the device is autosuspended, will the unpowered chip fail to ACK the
> transfers and return -EREMOTEIO?

Probably will.

> [Severity: High]
> This is a pre-existing issue, but does mma8452_remove() access unpowered =
I2C
> registers and cause unbalanced regulator disables?
>
> drivers/iio/accel/mma8452.c:mma8452_remove() {
>     ...
> 	mma8452_standby(iio_priv(indio_dev));
>
> 	regulator_disable(data->vddio_reg);
> 	regulator_disable(data->vdd_reg);
>     ...
> }
>
> If the device is runtime suspended, the vdd and vddio regulators are alre=
ady
> disabled. Since pm_runtime_disable() does not wake the device,
> mma8452_remove() unconditionally calls mma8452_standby() which will time =
out
> on an unpowered bus.
>
> Will the subsequent unconditional regulator_disable() calls drive the usa=
ge
> counts below zero?

Yes and yes.

> [Severity: High]
> This is a pre-existing issue, but are read-modify-write operations on I2C
> registers in sysfs operations performed without holding data->lock?

Yes. But I don't think the data->lock is supposed to be used for this
purpose. It looks like the purpose is to protect the ACTIVE/STANDBY
state handling in mma8452_change_config().

>
> drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
>     ...
> 	case IIO_EV_DIR_RISING:
> 		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
> 		if (val < 0)
> 			return val;
>     ...
> }
>
> In functions like mma8452_write_event_config(), an I2C read of the
> configuration register happens completely outside data->lock.
>
> If two threads execute this concurrently, could they both read the old
> state, modify different bits, and serialize on mma8452_change_config(),
> causing the second thread to unconditionally overwrite the first thread's
> modifications?

Looks like a bug. I will try to write up a fix for this and all the
other similar race conditions that this driver seems to have quite a few
of.

/Esben

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-=
open-drain-v6-0-9b252804ee80@geanix.com?part=3D5
