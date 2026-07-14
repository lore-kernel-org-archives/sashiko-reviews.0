Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5105043F4B5
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021426; cv=none; b=rPj6gJXQtTv3Mlh82EcLj7J0Vk3dd2CRh26v780Dg3eY+T9wYKTQtycN4/6IjGCT7uIKoFOvplLl9ChlgGUJsAGN7vgNH+AjK6pLv1TXqegHeXd7MGsADFdu3/IqMm/IZzu+riRWg5Fszq7qNE+I/oeiqH1QRZ1ts/Ea5WV4O1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021426; c=relaxed/simple;
	bh=3eMpBVPuMLm/bxuwADQsGqkfkNKWM6K+WJCRJIz6FEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qp7vspAe/GBR9E1MReBln6Jp+Veux2zZOpB5DBYOANd5STTg7jW5Lbed7w4BJskIxMk8r6fNPnih1WHFpL+X/fiSVbGfes7VOL8t5Uu1I1sS1JrcryQvghHiOZCm1MPFhRErv7ei3ttdaZ1VtS3cicPvlckJ+SCt93wz6e40Nqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0D31F000E9;
	Tue, 14 Jul 2026 09:30:15 +0000 (UTC)
Message-ID: <5e17bba2-9259-4d39-8170-275927835943@tuxon.dev>
Date: Tue, 14 Jul 2026 12:30:13 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment
 on resume
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
 <20260713135032.ADFB41F00A3A@smtp.kernel.org>
 <alUZfNwy4VlMr06f@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <alUZfNwy4VlMr06f@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/13/26 19:59, Frank Li wrote:
> On Mon, Jul 13, 2026 at 01:50:32PM +0000,sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] Removal of the DATBASn save/restore mechanism completely breaks the I3C bus upon resume for previously attached devices, and fails to resume if the bus was fully occupied.
>> --
>>
>> --- Patch [6]: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume ---
>> commit e4ac838c055dc33beb2ff4e8968a032da48a2a47
>> Author: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>
>> i3c: renesas: Perform Dynamic Address Assignment on resume
>>
>> This commit updates the suspend/resume operations by moving them out of
>> the noirq phase and attempting to perform Dynamic Address Assignment on
>> resume. It also removes the save and restore of the DATBASn registers.
>>
>>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>>> --- a/drivers/i3c/master/renesas-i3c.c
>>> +++ b/drivers/i3c/master/renesas-i3c.c
>> [ ... ]
>>
>>> @@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>>>   	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
>>>   		       MSDVAD_MDYAD(i3c->dyn_addr));
>>>
>>> -	/* Restore Device Address Table values. */
>>> -	for (i = 0; i < i3c->maxdevs; i++)
>>> -		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
>>> -
>>>   	/* I3C hw init. */
>>>   	renesas_i3c_hw_init(i3c);
>>>
>>> +	ret = i3c_master_do_daa_ext(&i3c->base, true);
>> [Severity: High]
>> Does removing the DATBASn save and restore mechanism break communication
>> with previously attached devices upon resume?
>>
>> Looking at renesas_i3c_daa(), it explicitly skips hardware register
>> initialization for previously attached devices:
>>
>> renesas_i3c_daa() {
>>          ...
>>          if (olddevs & BIT(pos))
>>                  continue;
>>          ...
>> }
>>
>> Since the controller was reset during suspend, won't these hardware
>> registers remain uninitialized (0) if DATBASn isn't manually restored here?
>>
>> Additionally, if the bus was fully occupied before suspend, will this cause
>> the DAA process to abort entirely?
>>
>> renesas_i3c_daa() {
>>          ...
>>          ret = renesas_i3c_get_free_pos(i3c);
>>          if (ret < 0)
>>                  return ret;
>>          ...
>> }
>>
>> If the bus is full, free_pos would be 0, causing this to return -ENOSPC
>> immediately. This aborts before the ENTDAA command is sent, which would
>> leave the previously attached devices permanently stranded without dynamic
>> addresses.
> Please check this sashiko review result?

I tried to address this though the versions v2-v4 variant of this patch that 
I've posted previously but after more investigation and thinking it looked to me 
that the solution to this is not that simple and related only to this driver 
(see below).

Last time I've asked for some guidance [1] but got no input on it.

Apart from v4, I tried (before posting v5) to use separate free_pos list to be 
used while resuming, and still use only i3c_master_add_i3c_dev_locked() in 
renesas_i3c_daa() but that didn't work either, because the devices (present 
before suspend and) discovered at resume, ended up to be added to the new list 
then deleted by the code of i3c_master_add_i3c_dev_locked().

I have also thought about increasing the free_pos bitmask with one extra entry 
while resuming to allow attach, detach, reattach work (for the devices connected 
before suspend), but I don't think that is going to work either, and looks 
hackish to me.

I also tried calling i3c_master_detach_free_devs() (only the code for I3C 
devices) before running DAA on resume but that wasn't enough for the solution to 
work.

I think this issue reported by sashiko can be encountered (at some point) on all 
the drivers that track and limit the number of attached devices with a bitmask 
(or other mechanism) and check that bitmask in the ->attach_i3c_dev.

E.g., on the Renesas RZ/G3S I can end up to that point even w/o the code from 
this patch doing the following:
1/ connect 2 I3C devices to the bus (I'm using the NXP P3T1085UK-ARD with 2
    temperature sensors)
2/ after the 2 I3C devices are attached, simulate the I3C bus is
    full (no entries in the free_pos mask) (with the diff patch below)
3/ cut the power to the NXP P3T1085UK-ARD board
4/ connect the power to the NXP P3T1085UK-ARD
5/ at this point if I run do_daa the devices are not going to attach anymore

I can simulate this on my side. I think it is the case for any other driver 
following the above mentioned pattern for attaching.

That was the reason I have currently dropped the attempt to solve the problem 
highlighted by sashiko as its solution looks to me to be more complicated and 
involved more testing to be done, not only related to this driver.

Since the issue is not only related to this patch but more on how the attach 
procedure works, and can be reproduced w/o this patch, I considered only the 
approach in this patch was be enough for suspend/resume fix and later fixes 
should be added to cover this complicated scenario.

Please let me know if you have any suggestions on how to go forward with this 
problem.

This is the patch I used for simulating full bus:

 > git show
commit 01f99391ab3e (HEAD)
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Date:   Tue Jul 14 11:49:14 2026 +0300

     test

     Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f1be38a640ca..4cb98328c8eb 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -810,6 +810,29 @@ static ssize_t do_daa_store(struct device *dev,

  static DEVICE_ATTR_WO(do_daa);

+bool i3c_full_bus = false;
+
+static ssize_t full_bus_store(struct device *dev,
+                           struct device_attribute *attr,
+                           const char *buf, size_t count)
+{
+       struct i3c_master_controller *master = dev_to_i3cmaster(dev);
+       bool val;
+       int ret;
+
+       i3c_full_bus = true;
+
+       return count;
+}
+
+static DEVICE_ATTR_WO(full_bus);
+
+bool i3c_get_full_bus(void)
+{
+       return i3c_full_bus;
+}
+EXPORT_SYMBOL_GPL(i3c_get_full_bus);
+
  static struct attribute *i3c_masterdev_attrs[] = {
         &dev_attr_mode.attr,
         &dev_attr_current_master.attr,
@@ -822,6 +845,7 @@ static struct attribute *i3c_masterdev_attrs[] = {
         &dev_attr_hdrcap.attr,
         &dev_attr_hotjoin.attr,
         &dev_attr_do_daa.attr,
+       &dev_attr_full_bus.attr,
         NULL,
  };
  ATTRIBUTE_GROUPS(i3c_masterdev);
diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 65151991b4ec..8e78ef602c51 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -324,6 +324,9 @@ static inline u32 datbas_dvdyad_with_parity(u8 addr)

  static int renesas_i3c_get_free_pos(struct renesas_i3c *i3c)
  {
+       if (i3c_get_full_bus())
+               return -ENOSPC;
+
         if (!(i3c->free_pos & GENMASK(i3c->maxdevs - 1, 0)))
                 return -ENOSPC;

@@ -689,6 +692,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)

         renesas_i3c_wait_xfer(i3c, xfer);

+       if (cmd->rx_count >= i3c->maxdevs)
+               newdevs = 0;
+       else
+               newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
+
         newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
         newdevs &= ~olddevs;

@@ -867,6 +875,7 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
         struct renesas_i3c_i2c_dev_data *data;
         int pos;

+       pr_err("%s(): in\n", __func__);
         pos = renesas_i3c_get_free_pos(i3c);
         if (pos < 0)
                 return pos;
@@ -883,6 +892,7 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
                                     datbas_dvdyad_with_parity(i3c->addrs[pos]));
         i3c_dev_set_master_data(dev, data);

+       pr_err("%s(): out\n", __func__);
         return 0;
  }

@@ -894,6 +904,8 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc 
*dev,
         struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
         int pos;

+       pr_err("%s(): in\n", __func__);
+
         pos = renesas_i3c_get_free_pos(i3c);

         if (data->index > pos && pos >= 0) {
@@ -911,7 +923,7 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc 
*dev,
         renesas_writel(i3c->regs, DATBAS(data->index),
                        DATBAS_DVSTAD(dev->info.static_addr) |
                        datbas_dvdyad_with_parity(i3c->addrs[data->index]));
-
+       pr_err("%s(): out\n", __func__);
         return 0;
  }

@@ -922,11 +934,13 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc 
*dev)
         struct renesas_i3c *i3c = to_renesas_i3c(m);

         renesas_writel(i3c->regs, DATBAS(data->index), 0);
+       pr_err("%s(): in\n", __func__);

         i3c_dev_set_master_data(dev, NULL);
         i3c->addrs[data->index] = 0;
         i3c->free_pos |= BIT(data->index);
         kfree(data);
+       pr_err("%s(): out\n", __func__);
  }

  static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 4d2a68793324..3ab31d85bff6 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -22,6 +22,8 @@
  #define I3C_BROADCAST_ADDR             0x7e
  #define I3C_MAX_ADDR                   GENMASK(6, 0)

+bool i3c_get_full_bus(void);
+
  struct i2c_client;

  /* notifier actions. notifier call data is the struct i3c_bus */


Applied on top of the fixes patches from this series except the one in this thread:

01f99391ab3e (HEAD) test
6d3e526d34a3 Revert "i3c: renesas: Perform Dynamic Address Assignment on resume"
7256e1a32469 i3c: renesas: Clean DATBAS register on detach
1c9e940709a2 i3c: renesas: Perform Dynamic Address Assignment on resume
305787a2f797 i3c: renesas: Reset the controller on resume
d6edb5c5d46a i3c: renesas: Reconfigure the DATBAS register on re-attach
88ab25e78d95 i3c: renesas: Follow the reset deassert order used in probe
80908175920f i3c: renesas: Restore STDBR and EXTBR registers on resume
455ff70955fc i3c: renesas: Check that the transfer is valid before accessing it
27bc7a253560 arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
fd146e7c97f8 pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C 
power source
277b0db8d168 dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing 
I3C power source option
de297915b104 pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
e9a915ca8cc7 pinctrl: renesas: rzg2l: Generalize the power source code
34cf6dafc474 (tag: next-20260709, linux-next/master) Add linux-next specific 
files for 20260709

The steps I followed to reproduce the problem even w/o the patch in this series 
is at [2].

Thank you,
Claudiu

[1] https://lore.kernel.org/all/559b8b0c-412a-4d0f-9872-a4c92f3b9611@kernel.org/
[2] 
https://github.com/claudiubeznea/logs/blob/cc6a6e80936b8368a2187c72dd7e23a6a88b5a84/logs
